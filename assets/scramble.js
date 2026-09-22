// Add data-scramble to any element containing plain text to decode it on load.
(() => {
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;

  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const targets = document.querySelectorAll('[data-scramble]');

  targets.forEach((element, index) => {
    const original = element.textContent;
    if (!original.trim()) return;

    const accessible = document.createElement('span');
    accessible.className = 'scramble-sr-only';
    accessible.textContent = original;

    const visual = document.createElement('span');
    visual.setAttribute('aria-hidden', 'true');
    visual.textContent = original;
    element.replaceChildren(accessible, visual);

    const start = performance.now() + index * 220;
    const duration = Math.max(800, original.length * 42);
    let lastFrame = -1;

    function frame(now) {
      if (now < start) {
        requestAnimationFrame(frame);
        return;
      }

      const progress = Math.min((now - start) / duration, 1);
      const revealed = Math.floor(progress * original.length);
      const frameNumber = Math.floor((now - start) / 45);

      if (frameNumber !== lastFrame || progress === 1) {
        visual.textContent = Array.from(original, (character, position) => {
          if (position < revealed || !/[A-Za-z0-9]/.test(character)) return character;
          return characters[Math.floor(Math.random() * characters.length)];
        }).join('');
        lastFrame = frameNumber;
      }

      if (progress < 1) requestAnimationFrame(frame);
    }

    requestAnimationFrame(frame);
  });
})();
