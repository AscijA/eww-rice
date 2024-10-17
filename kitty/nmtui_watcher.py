# ~/.config/kitty/mywatcher.py
from typing import Any, Dict

from kitty.boss import Boss
from kitty.window import Window



def on_focus_change(boss: Boss, window: Window, data: Dict[str, Any])-> None:
  window.close()


