<script setup lang="ts">
const mode = import.meta.env.MODE;
const baseUrl = import.meta.env.BASE_URL;
const someValue = import.meta.env.SOME_VALUE;
</script>
<template>
  <div class="about">
    <h1>This is an about page</h1>
    <div>
      Mode: {{ mode }}
    </div>
    <div>
      Base URL: {{ baseUrl }}
    </div>
    <div>
      Some Value: {{ someValue }}
    </div>
  </div>
  
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
  }
}
</style>
