  overlay.style.display = 'none';
  overlay.innerHTML = `
    <div class="container">
      <div class="earth"></div>
      <h1 class="title">你似乎未连接到 Internet</h1>
      <p class="description">错误代码: ERR_INTERNET_DISCONNECTED</p>
      <div class="retry-info">
        <span>请尝试：</span>
      </div>
      <button class="retry-button">刷新</button>
      <div class="game-info">
        想在等待时玩游戏吗? <span>启动游戏</span>
      </div>
    </div>
  `;
  Object.assign(overlay.style, {
    position: 'fixed',
    top: 0,
    left:0,
    width: '100%',
    height: '100%',
    background: '#f8f9fa',
    color: '#343a40',
    zIndex: 99999,
    fontFamily: 'system-ui, sans-serif',
    display: 'flex',
    alignItems: 'left',
    justifyContent: 'left',
    textAlign: 'left'
  });
  document.body.appendChild(overlay);

  // 创建顶部加载条（初始隐藏）
  const loadingBar = document.createElement('div');
  loadingBar.id = 'fakeLoadingBar';
  Object.assign(loadingBar.style, {
    position: 'fixed',
    top: 0,                     // 改为顶部
    left: 0,
    width: '0%',
    height: '3px',
    background: 'linear-gradient(90deg, #3a8cff, #00c6ff, #3a8cff)',
    backgroundSize: '200% 100%',
    animation: 'shine 1.5s linear infinite',
    zIndex: 100000,
    display: 'none',
    borderRadius: '0 0 2px 0',  // 底部圆角改为右下角（可选）
    transition: 'width 0.05s linear'
  });
  document.body.appendChild(loadingBar);

  // 添加渐变光效动画
  const style = document.createElement('style');
  style.textContent = `
  @keyframes shine {
    0% { background-position: 100% 0; }
    100% { background-position: -100% 0; }
  }
  @keyframes zoomFade {
