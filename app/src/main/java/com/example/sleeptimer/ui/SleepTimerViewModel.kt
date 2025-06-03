package com.example.sleeptimer.ui

import android.content.Context
import android.media.MediaPlayer
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class SleepTimerViewModel : ViewModel() {
    var remainingTime by mutableStateOf(0L)
        private set
    
    var isTimerRunning by mutableStateOf(false)
        private set
    
    var selectedSound by mutableStateOf<Sound?>(null)
        private set
    
    private var timerJob: Job? = null
    private var mediaPlayer: MediaPlayer? = null
    
    fun startTimer(minutes: Int, context: Context) {
        if (isTimerRunning) return
        
        remainingTime = minutes * 60L
        isTimerRunning = true
        
        // Start playing the selected sound when timer starts
        selectedSound?.let { sound ->
            playSound(sound, context)
        }
        
        timerJob = viewModelScope.launch {
            while (remainingTime > 0) {
                delay(1000)
                remainingTime--
            }
            // Timer has ended
            stopTimer()
            stopSound() // Ensure sound is stopped when timer ends
        }
    }
    
    fun stopTimer() {
        timerJob?.cancel()
        timerJob = null
        isTimerRunning = false
        stopSound()
    }
    
    fun selectSound(sound: Sound, context: Context) {
        stopSound()
        selectedSound = sound
        // Only play the sound if the timer is running
        if (isTimerRunning) {
            playSound(sound, context)
        }
    }
    
    private fun playSound(sound: Sound, context: Context) {
        stopSound()
        mediaPlayer = MediaPlayer.create(context, sound.resourceId).apply {
            isLooping = true
            start()
        }
    }
    
    private fun stopSound() {
        mediaPlayer?.apply {
            if (isPlaying) {
                stop()
            }
            release()
        }
        mediaPlayer = null
    }
    
    override fun onCleared() {
        super.onCleared()
        stopTimer()
        stopSound()
    }
} 