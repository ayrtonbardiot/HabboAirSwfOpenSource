// by nota

//com.sulake.habbo.toolbar.extensions.purse.CurrencyIndicatorBase

package com.sulake.habbo.toolbar.extensions.purse
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import __AS3__.vec.Vector;
    import flash.utils.Timer;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import flash.events.TimerEvent;
    import com.sulake.habbo.utils._SafeStr_401;

    public class CurrencyIndicatorBase implements _SafeStr_3242 
    {

        protected static const _SafeStr_8933:int = 0;
        protected static const _SafeStr_8934:int = 1;
        private static const _SafeStr_8935:Number = 0.025;

        protected var _window:_SafeStr_3133;
        protected var _windowManager:_SafeStr_1695;
        protected var _assets:_SafeStr_21;
        private var _disposed:Boolean = false;
        private var _SafeStr_5157:IStaticBitmapWrapperWindow;
        private var _SafeStr_5159:uint;
        private var _SafeStr_5160:uint;
        private var _textElementName:String;
        private var _SafeStr_5156:Vector.<String> = new Vector.<String>();
        private var _SafeStr_5158:uint;
        private var _SafeStr_5154:String = null;
        private var _animDirection:uint = 0;
        private var _animOffset:int;
        private var _SafeStr_5155:Timer;
        private var _overlayTimer:Timer;
        private var _overlayPhase:Number;
        private var _overlayStartValue:int;
        private var _overlayEndValue:int;

        public function CurrencyIndicatorBase(_arg_1:_SafeStr_1695, _arg_2:_SafeStr_21)
        {
            _window = null;
            _windowManager = _arg_1;
            _assets = _arg_2;
            _SafeStr_5155 = null;
            _overlayTimer = new Timer(40);
            _overlayTimer.addEventListener("timer", onOverlayTimer);
        }

        protected function set bgColorLight(_arg_1:uint):void
        {
            _SafeStr_5159 = _arg_1;
        }

        protected function set bgColorDark(_arg_1:uint):void
        {
            _SafeStr_5160 = _arg_1;
        }

        protected function set textElementName(_arg_1:String):void
        {
            _textElementName = _arg_1;
        }

        protected function set iconAnimationDelay(_arg_1:uint):void
        {
            _SafeStr_5158 = _arg_1;
        }

        protected function set amountZeroText(_arg_1:String):void
        {
            _SafeStr_5154 = _arg_1;
        }

        protected function get amountZeroText():String
        {
            return (_SafeStr_5154);
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (_overlayTimer != null)
            {
                _overlayTimer.stop();
                _overlayTimer = null;
            };
            if (_SafeStr_5155)
            {
                _SafeStr_5155.stop();
                _SafeStr_5155 = null;
            };
            if (_SafeStr_5156)
            {
                _SafeStr_5156 = null;
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _disposed = true;
        }

        public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
        }

        public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
        }

        protected function onContainerClick(_arg_1:WindowMouseEvent):void
        {
        }

        protected function createWindow(_arg_1:String, _arg_2:String):void
        {
            var _local_4:* = null;
            var _local_3:XmlAsset = (_assets.getAssetByName(_arg_1) as XmlAsset);
            if (_local_3)
            {
                _window = (_windowManager.buildFromXML((_local_3.content as XML), 1) as _SafeStr_3133);
                if (_window)
                {
                    _window.addEventListener("WME_CLICK", onContainerClick);
                    _window.addEventListener("WME_OVER", onContainerMouseOver);
                    _window.addEventListener("WME_OUT", onContainerMouseOut);
                    _local_4 = [];
                    if (_window.groupChildrenWithTag("ICON", _local_4, -1) == 1)
                    {
                        _SafeStr_5157 = (_local_4[0] as IStaticBitmapWrapperWindow);
                        setIconBitmap(_arg_2);
                    };
                };
            };
        }

        protected function animateIcon(_arg_1:int):void
        {
            _animDirection = _arg_1;
            if (((_SafeStr_5157) && (_SafeStr_5156.length > 0)))
            {
                if (_animDirection == 0)
                {
                    _animOffset = 0;
                }
                else
                {
                    _animOffset = (_SafeStr_5156.length - 1);
                };
                _SafeStr_5155 = new Timer(_SafeStr_5158, _SafeStr_5156.length);
                _SafeStr_5155.addEventListener("timer", onAnimationTimer);
                _SafeStr_5155.addEventListener("timerComplete", onAnimationTimerComplete);
                _SafeStr_5155.start();
                onAnimationTimer(null);
            };
        }

        protected function setAmount(_arg_1:int, _arg_2:int=-1):void
        {
            setText(_arg_1.toString());
        }

        protected function setText(_arg_1:String):void
        {
            if (_window)
            {
                _window.findChildByName(_textElementName).caption = _arg_1;
            };
        }

        protected function setTextUnderline(_arg_1:Boolean):void
        {
            if (_window)
            {
                ITextWindow(_window.findChildByName(_textElementName)).underline = _arg_1;
            };
        }

        protected function set iconAnimationSequence(_arg_1:Array):void
        {
            var _local_2:* = null;
            for each (_local_2 in _arg_1)
            {
                _SafeStr_5156.push(_local_2);
            };
        }

        private function onAnimationTimer(_arg_1:TimerEvent):void
        {
            if (((_SafeStr_5157) && (_SafeStr_5156.length > 0)))
            {
                setIconBitmap(_SafeStr_5156[_animOffset]);
                if (_animDirection == 0)
                {
                    _animOffset++;
                    _animOffset = ((_animOffset < _SafeStr_5156.length) ? _animOffset : (_SafeStr_5156.length - 1));
                }
                else
                {
                    _animOffset--;
                    _animOffset = ((_animOffset >= 0) ? _animOffset : 0);
                };
            };
        }

        private function onAnimationTimerComplete(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5156.length > 0)
            {
                setIconBitmap(_SafeStr_5156[0]);
            };
        }

        private function setIconBitmap(_arg_1:String):void
        {
            if (_SafeStr_5157)
            {
                _SafeStr_5157.assetUri = _arg_1;
            };
        }

        private function onContainerMouseOver(_arg_1:WindowMouseEvent):void
        {
            _window.findChildByTag("BGCOLOR").color = _SafeStr_5159;
        }

        private function onContainerMouseOut(_arg_1:WindowMouseEvent):void
        {
            _window.findChildByTag("BGCOLOR").color = _SafeStr_5160;
        }

        protected function animateChange(_arg_1:int, _arg_2:int):void
        {
            var _local_3:* = null;
            _overlayPhase = 0;
            _overlayStartValue = _arg_1;
            _overlayEndValue = _arg_2;
            if (_window != null)
            {
                _local_3 = _window.findChildByName("change");
                if (_local_3 != null)
                {
                    _local_3.caption = (((_arg_2 > _arg_1) ? "+" : "") + (_arg_2 - _arg_1).toString());
                };
            };
            _overlayTimer.start();
            onOverlayTimer(null);
        }

        private function onOverlayTimer(_arg_1:TimerEvent):void
        {
            var _local_3:Number = ((Math.pow((_overlayPhase - 0.5), 3) * 4) + 0.5);
            setAmount(_SafeStr_401.lerp(Math.max(0, ((_overlayPhase * 2) - 1)), _overlayStartValue, _overlayEndValue));
            var _local_2:_SafeStr_3133 = (_window.findChildByName("change_overlay") as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.visible = true;
            _local_2.blend = (1 - (Math.abs((0.5 - _local_3)) * 2));
            _local_2.x = _SafeStr_401.lerp(_local_3, 0, (_window.width - _local_2.width));
            _overlayPhase = (_overlayPhase + 0.025);
            if (_overlayPhase >= 1)
            {
                _local_2.visible = false;
                _overlayTimer.stop();
                setAmount(_overlayEndValue);
            };
        }


    }
}//package com.sulake.habbo.toolbar.extensions.purse

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3242 = "_-Y2" (String#19160, DoABC#4)
// _SafeStr_401 = "_-e1d" (String#5870, DoABC#4)
// _SafeStr_5154 = "_-V8" (String#19218, DoABC#4)
// _SafeStr_5155 = "_-Sg" (String#3605, DoABC#4)
// _SafeStr_5156 = "_-4X" (String#4719, DoABC#4)
// _SafeStr_5157 = "_-O1i" (String#10947, DoABC#4)
// _SafeStr_5158 = "_-21y" (String#20260, DoABC#4)
// _SafeStr_5159 = "_-b19" (String#15838, DoABC#4)
// _SafeStr_5160 = "_-Qe" (String#18603, DoABC#4)
// _SafeStr_8933 = "_-I16" (String#39367, DoABC#4)
// _SafeStr_8934 = "_-z1r" (String#33688, DoABC#4)
// _SafeStr_8935 = "_-01J" (String#39426, DoABC#4)


