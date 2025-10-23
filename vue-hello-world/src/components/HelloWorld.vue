<script setup>
import { ref, onMounted } from 'vue'

const greeting = ref('🚀 部署测试成功！')
const subtitle = ref('GitHub Pages 部署验证页面')
const message = ref('如果你能看到这个页面，说明部署已经生效！最后更新时间：' + new Date().toLocaleString('zh-CN'))
const count = ref(0)
const isDarkTheme = ref(false)
const currentTime = ref(new Date().toLocaleString('zh-CN'))

const greetings = [
  'Hello World!',
  '你好，世界！',
  'Bonjour le monde!',
  '¡Hola Mundo!',
  'Ciao Mondo!',
  '안녕하세요 월드!'
]

const features = ref([
  {
    id: 1,
    icon: '⚡',
    title: '快速开发',
    description: 'Vite 极速热更新'
  },
  {
    id: 2,
    icon: '🎨',
    title: '现代设计',
    description: '渐变色彩与动效'
  },
  {
    id: 3,
    icon: '📱',
    title: '响应式布局',
    description: '完美适配各种设备'
  },
  {
    id: 4,
    icon: '🔧',
    title: '工程化',
    description: '现代化开发流程'
  },
  {
    id: 5,
    icon: '🌿',
    title: '绿色生态',
    description: '生态系统完善'
  },
  {
    id: 6,
    icon: '🚀',
    title: '性能优越',
    description: '打包体积小，加载快'
  }
])

const changeGreeting = () => {
  const currentIndex = greetings.indexOf(greeting.value)
  const nextIndex = (currentIndex + 1) % greetings.length
  greeting.value = greetings[nextIndex]
}

const toggleTheme = () => {
  isDarkTheme.value = !isDarkTheme.value
  document.body.style.filter = isDarkTheme.value ? 'invert(1) hue-rotate(180deg)' : ''
}

const increment = () => {
  count.value++
}

const decrement = () => {
  count.value--
}

const particles = ref(null)

const createParticle = () => {
  const particle = document.createElement('div')
  particle.className = 'particle'
  particle.style.left = Math.random() * 100 + '%'
  particle.style.width = Math.random() * 10 + 5 + 'px'
  particle.style.height = particle.style.width
  particle.style.animationDelay = Math.random() * 10 + 's'
  particle.style.animationDuration = Math.random() * 10 + 10 + 's'

  if (particles.value) {
    particles.value.appendChild(particle)

    setTimeout(() => {
      particle.remove()
    }, 20000)
  }
}

onMounted(() => {
  setInterval(createParticle, 1000)
  setInterval(() => {
    currentTime.value = new Date().toLocaleString('zh-CN')
  }, 1000)
})
</script>

<template>
  <div class="hello-world">
    <div class="card">
      <h1 class="title">{{ greeting }}</h1>
      <p class="subtitle">{{ subtitle }}</p>
      <p class="message">{{ message }}</p>

      <div class="features-grid">
        <div class="feature-card" v-for="feature in features" :key="feature.id">
          <div class="feature-icon">{{ feature.icon }}</div>
          <div class="feature-title">{{ feature.title }}</div>
          <div class="feature-desc">{{ feature.description }}</div>
        </div>
      </div>

      <div class="button-group">
        <button class="btn btn-primary" @click="changeGreeting">
          <span>🎉</span>
          <span>换个问候</span>
        </button>
        <button class="btn btn-secondary" @click="toggleTheme">
          <span>🎨</span>
          <span>切换主题</span>
        </button>
      </div>

      <div class="counter-section">
        <h3>互动计数器</h3>
        <div class="counter-controls">
          <button class="counter-btn" @click="decrement">−</button>
          <span class="counter-value">{{ count }}</span>
          <button class="counter-btn" @click="increment">+</button>
        </div>
      </div>

      <div class="tech-stack">
        <h3>技术栈</h3>
        <div class="tech-badges">
          <span class="badge vue">Vue 3</span>
          <span class="badge vite">Vite</span>
          <span class="badge js">JavaScript</span>
        </div>
      </div>

      <div class="deployment-info">
        <h3>🚀 部署信息</h3>
        <p><strong>当前时间：</strong>{{ currentTime }}</p>
        <p><strong>部署状态：</strong><span class="status-success">✅ 成功</span></p>
        <p><strong>访问地址：</strong><a href="https://mmsmm.github.io/vue-hello-world/" target="_blank">GitHub Pages</a></p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.hello-world {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 2rem;
}

.card {
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-radius: 30px;
  padding: 60px 80px;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
  text-align: center;
  max-width: 900px;
  width: 100%;
  transform: translateY(0);
  transition: all 0.3s ease;
  animation: slideIn 0.8s ease-out;
}

.card:hover {
  transform: translateY(-10px);
  box-shadow: 0 35px 60px -15px rgba(0, 0, 0, 0.3);
}

@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateY(50px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.title {
  font-size: 4rem;
  font-weight: 700;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  margin-bottom: 20px;
  animation: textGlow 2s ease-in-out infinite alternate;
}

@keyframes textGlow {
  from {
    filter: brightness(1);
  }
  to {
    filter: brightness(1.2);
  }
}

.subtitle {
  font-size: 1.5rem;
  color: #6b7280;
  margin-bottom: 30px;
  opacity: 0;
  animation: fadeInUp 0.8s ease-out 0.3s forwards;
}

.message {
  font-size: 1.1rem;
  color: #4b5563;
  line-height: 1.6;
  margin-bottom: 40px;
  opacity: 0;
  animation: fadeInUp 0.8s ease-out 0.6s forwards;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
  opacity: 0;
  animation: fadeInUp 0.8s ease-out 0.9s forwards;
}

.feature-card {
  background: linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%);
  border-radius: 15px;
  padding: 25px;
  transition: all 0.3s ease;
  border: 2px solid transparent;
}

.feature-card:hover {
  transform: translateY(-5px);
  border-color: #667eea;
  box-shadow: 0 10px 25px -5px rgba(102, 126, 234, 0.3);
}

.feature-icon {
  font-size: 2.5rem;
  margin-bottom: 15px;
}

.feature-title {
  font-size: 1rem;
  font-weight: 600;
  color: #374151;
  margin-bottom: 8px;
}

.feature-desc {
  font-size: 0.9rem;
  color: #6b7280;
  line-height: 1.4;
}

.button-group {
  display: flex;
  gap: 15px;
  justify-content: center;
  flex-wrap: wrap;
  margin-bottom: 40px;
  opacity: 0;
  animation: fadeInUp 0.8s ease-out 1.2s forwards;
}

.btn {
  padding: 15px 30px;
  border: none;
  border-radius: 50px;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

.btn-primary {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  box-shadow: 0 4px 15px 0 rgba(102, 126, 234, 0.4);
}

.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px 0 rgba(102, 126, 234, 0.5);
}

.btn-secondary {
  background: white;
  color: #667eea;
  border: 2px solid #667eea;
}

.btn-secondary:hover {
  background: #667eea;
  color: white;
  transform: translateY(-2px);
}

.counter-section {
  background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
  border-radius: 15px;
  padding: 30px;
  margin-bottom: 30px;
  opacity: 0;
  animation: fadeInUp 0.8s ease-out 1.5s forwards;
}

.counter-section h3 {
  color: #d97706;
  font-size: 1.5rem;
  margin-bottom: 20px;
}

.counter-controls {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;
}

.counter-btn {
  background: white;
  color: #d97706;
  border: 2px solid #d97706;
  padding: 12px 24px;
  border-radius: 25px;
  font-size: 1.2rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.counter-btn:hover {
  background: #d97706;
  color: white;
  transform: scale(1.05);
}

.counter-value {
  font-size: 2.5rem;
  font-weight: 700;
  color: #d97706;
  min-width: 80px;
  text-align: center;
}

.tech-stack {
  opacity: 0;
  animation: fadeInUp 0.8s ease-out 1.8s forwards;
}

.tech-stack h3 {
  color: #374151;
  font-size: 1.5rem;
  margin-bottom: 20px;
}

.tech-badges {
  display: flex;
  justify-content: center;
  gap: 15px;
  flex-wrap: wrap;
}

.badge {
  padding: 8px 16px;
  border-radius: 20px;
  font-weight: 600;
  font-size: 0.9rem;
}

.badge.vue {
  background: #4fc08d;
  color: white;
}

.badge.vite {
  background: #646cff;
  color: white;
}

.badge.js {
  background: #f7df1e;
  color: #323330;
}

.deployment-info {
  background: linear-gradient(135deg, #dcfce7 0%, #bbf7d0 100%);
  border-radius: 15px;
  padding: 30px;
  margin-top: 30px;
  opacity: 0;
  animation: fadeInUp 0.8s ease-out 2.1s forwards;
}

.deployment-info h3 {
  color: #16a34a;
  font-size: 1.5rem;
  margin-bottom: 20px;
}

.deployment-info p {
  color: #15803d;
  margin-bottom: 10px;
  font-size: 1rem;
}

.status-success {
  color: #16a34a;
  font-weight: 600;
}

.deployment-info a {
  color: #16a34a;
  text-decoration: none;
  font-weight: 600;
}

.deployment-info a:hover {
  text-decoration: underline;
}

@media (max-width: 768px) {
  .card {
    padding: 40px 25px;
    margin: 20px;
  }

  .title {
    font-size: 2.5rem;
  }

  .subtitle {
    font-size: 1.2rem;
  }

  .features-grid {
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 15px;
  }

  .feature-card {
    padding: 20px;
  }

  .button-group {
    flex-direction: column;
    align-items: center;
  }

  .btn {
    width: 200px;
    justify-content: center;
  }

  .counter-controls {
    gap: 15px;
  }

  .counter-btn {
    padding: 10px 20px;
    font-size: 1rem;
  }

  .counter-value {
    font-size: 2rem;
    min-width: 60px;
  }
}
</style>
