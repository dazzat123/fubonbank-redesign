/**
 * Fubon Bank - Main JavaScript
 * Apple-Style Website
 */

// Navbar scroll effect
document.addEventListener('DOMContentLoaded', function() {
  const navbar = document.querySelector('.navbar');
  
  if (navbar) {
    window.addEventListener('scroll', function() {
      if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    });
  }
  
  // Mobile menu toggle
  const menuToggle = document.querySelector('.navbar-toggle');
  const menu = document.querySelector('.navbar-menu');
  
  if (menuToggle && menu) {
    menuToggle.addEventListener('click', function() {
      menu.style.display = menu.style.display === 'flex' ? 'none' : 'flex';
    });
  }
  
  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });
  
  // Counter animation for statistics
  const counters = document.querySelectorAll('[data-counter]');
  
  counters.forEach(counter => {
    const target = +counter.getAttribute('data-counter');
    const duration = 2000;
    const increment = target / (duration / 16);
    let current = 0;
    
    const updateCounter = () => {
      current += increment;
      if (current < target) {
        counter.textContent = Math.floor(current).toLocaleString();
        requestAnimationFrame(updateCounter);
      } else {
        counter.textContent = target.toLocaleString();
      }
    };
    
    // Start animation when element is in view
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          updateCounter();
          observer.unobserve(entry.target);
        }
      });
    });
    
    observer.observe(counter);
  });
  
  // Lazy loading images
  const lazyImages = document.querySelectorAll('img[loading="lazy"]');
  
  if ('loading' in HTMLImageElement.prototype) {
    lazyImages.forEach(img => {
      img.src = img.dataset.src || img.src;
    });
  } else {
    // Fallback for browsers that don't support lazy loading
    const imageObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.dataset.src || img.src;
          imageObserver.unobserve(img);
        }
      });
    });
    
    lazyImages.forEach(img => imageObserver.observe(img));
  }
  
  // Form validation
  const forms = document.querySelectorAll('form[data-validate]');
  
  forms.forEach(form => {
    form.addEventListener('submit', function(e) {
      const inputs = form.querySelectorAll('input[required]');
      let valid = true;
      
      inputs.forEach(input => {
        if (!input.value.trim()) {
          valid = false;
          input.classList.add('error');
        } else {
          input.classList.remove('error');
        }
      });
      
      if (!valid) {
        e.preventDefault();
        alert('請填寫所有必填欄位');
      }
    });
  });
  
  // Accordion functionality
  const accordions = document.querySelectorAll('.accordion-header');
  
  accordions.forEach(accordion => {
    accordion.addEventListener('click', function() {
      const content = this.nextElementSibling;
      const isActive = this.classList.contains('active');
      
      // Close all accordions
      document.querySelectorAll('.accordion-header').forEach(h => {
        h.classList.remove('active');
        h.nextElementSibling.style.maxHeight = null;
      });
      
      // Toggle current accordion
      if (!isActive) {
        this.classList.add('active');
        content.style.maxHeight = content.scrollHeight + 'px';
      }
    });
  });
  
  // Tab functionality
  const tabs = document.querySelectorAll('.tab-header');
  
  tabs.forEach(tab => {
    tab.addEventListener('click', function() {
      const tabGroup = this.closest('.tab-group');
      const target = this.dataset.tab;
      
      // Remove active class from all tabs in group
      tabGroup.querySelectorAll('.tab-header').forEach(t => {
        t.classList.remove('active');
      });
      
      // Hide all tab content
      tabGroup.querySelectorAll('.tab-content').forEach(c => {
        c.classList.remove('active');
      });
      
      // Activate selected tab
      this.classList.add('active');
      tabGroup.querySelector(`[data-content="${target}"]`).classList.add('active');
    });
  });
  
  // Modal functionality
  const modalTriggers = document.querySelectorAll('[data-modal]');
  
  modalTriggers.forEach(trigger => {
    trigger.addEventListener('click', function() {
      const modalId = this.dataset.modal;
      const modal = document.getElementById(modalId);
      
      if (modal) {
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
      }
    });
  });
  
  document.querySelectorAll('.modal-close').forEach(close => {
    close.addEventListener('click', function() {
      const modal = this.closest('.modal');
      modal.classList.remove('active');
      document.body.style.overflow = '';
    });
  });
  
  // Close modal on outside click
  document.querySelectorAll('.modal').forEach(modal => {
    modal.addEventListener('click', function(e) {
      if (e.target === this) {
        this.classList.remove('active');
        document.body.style.overflow = '';
      }
    });
  });
});

// Utility functions
function formatNumber(num) {
  return num.toLocaleString('zh-HK');
}

function formatCurrency(amount, currency = 'HKD') {
  return new Intl.NumberFormat('zh-HK', {
    style: 'currency',
    currency: currency
  }).format(amount);
}

function formatDate(date) {
  return new Intl.DateTimeFormat('zh-HK', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  }).format(new Date(date));
}
