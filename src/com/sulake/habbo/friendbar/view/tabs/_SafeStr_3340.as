// by nota

//com.sulake.habbo.friendbar.view.tabs._SafeStr_3340

package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.motion._SafeStr_3336;
    import com.sulake.core.window.motion.Combo;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.ResizeTo;
    import com.sulake.core.window.motion.MoveBy;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class _SafeStr_3340 extends Tab 
    {

        protected static const ICON:String = "icon";
        protected static const _SafeStr_8562:String = "text";
        protected static const HEADER:String = "header";
        protected static const LABEL:String = "label";
        protected static const _SafeStr_8563:String = "button";
        private static const _SafeStr_8564:String = "add_friends_tab_xml";
        private static const ICON_RESOURCE:String = "find_friends_icon_png";
        private static const DEFAULT_COLOR:uint = 8374494;
        private static const _SafeStr_8565:uint = 9560569;
        private static const _SafeStr_4027:Array = [];
        private static const _SafeStr_6074:Array = [];

        private static var _SafeStr_6075:int = -1;


        public static function allocate():_SafeStr_3340
        {
            var _local_1:_SafeStr_3340 = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (_SafeStr_3340)());
            _local_1._SafeStr_4031 = false;
            _local_1._window = _local_1.allocateEntityWindow();
            return (_local_1);
        }


        public function allocateEntityWindow():_SafeStr_3133
        {
            var _local_1:_SafeStr_3133 = ((_SafeStr_6074.length > 0) ? _SafeStr_6074.pop() : (WINDOWING.buildFromXML((ASSETS.getAssetByName("add_friends_tab_xml").content as XML)) as _SafeStr_3133));
            var _local_4:IRegionWindow = IRegionWindow(_local_1.findChildByName("header"));
            _local_1.addEventListener("WME_CLICK", onMouseClick);
            _local_1.addEventListener("WME_OVER", onMouseOver);
            _local_1.addEventListener("WME_OUT", onMouseOut);
            _local_4.addEventListener("WME_CLICK", onMouseClick);
            _local_4.addEventListener("WME_OVER", onMouseOver);
            _local_4.addEventListener("WME_OUT", onMouseOut);
            if (_SafeStr_6075 < 0)
            {
                _SafeStr_6075 = _local_1.height;
            };
            _local_1.height = HEIGHT;
            var _local_3:_SafeStr_3264 = (_local_1.findChildByName("icon") as _SafeStr_3264);
            _local_3.disposesBitmap = false;
            if (ASSETS.getAssetByName("find_friends_icon_png") != null)
            {
                _local_3.bitmap = (ASSETS.getAssetByName("find_friends_icon_png").content as BitmapData);
            }
            else
            {
                (trace("crash"));
            };
            var _local_2:_SafeStr_3109 = _local_1.findChildByName("button");
            _local_2.addEventListener("WME_CLICK", onButtonClick);
            var _local_5:_SafeStr_3109 = _local_1.findChildByName("text");
            _local_5.visible = false;
            return (_local_1);
        }

        private function releaseEntityWindow(_arg_1:_SafeStr_3133):void
        {
            var _local_2:* = null;
            if (((_arg_1) && (!(_arg_1.disposed))))
            {
                _arg_1.procedure = null;
                _arg_1.removeEventListener("WME_CLICK", onMouseClick);
                _arg_1.removeEventListener("WME_OVER", onMouseOver);
                _arg_1.removeEventListener("WME_OUT", onMouseOut);
                _local_2 = IRegionWindow(_arg_1.findChildByName("header"));
                _local_2.removeEventListener("WME_CLICK", onMouseClick);
                _local_2.removeEventListener("WME_OVER", onMouseOver);
                _local_2.removeEventListener("WME_OUT", onMouseOut);
                _arg_1.findChildByName("button").removeEventListener("WME_CLICK", onButtonClick);
                _arg_1.findChildByName("text").visible = false;
                _arg_1.width = WIDTH;
                _arg_1.height = HEIGHT;
                if (_SafeStr_6074.indexOf(_arg_1) == -1)
                {
                    _SafeStr_6074.push(_arg_1);
                };
            };
        }

        override public function select(_arg_1:Boolean):void
        {
            if (!selected)
            {
                if ((((_arg_1) && (false)) && (_SafeStr_3336.getMotionByTarget(_window) == null)))
                {
                    _SafeStr_3336.runMotion(new Combo(new EaseOut(new ResizeTo(_window, 80, _window.width, _SafeStr_6075), 3), new EaseOut(new MoveBy(_window, 80, _window.x, -(_SafeStr_6075 - HEIGHT)), 3)));
                }
                else
                {
                    _window.height = _SafeStr_6075;
                    _window.y = (_window.y - (_window.height - HEIGHT));
                };
                _window.findChildByName("text").visible = true;
                super.select(_arg_1);
            };
        }

        override public function deselect(_arg_1:Boolean):void
        {
            if (selected)
            {
                _window.y = 0;
                _window.height = HEIGHT;
                _window.findChildByName("text").visible = false;
                super.deselect(_arg_1);
            };
        }

        override public function recycle():void
        {
            if (!disposed)
            {
                if (!_SafeStr_4031)
                {
                    if (_window)
                    {
                        releaseEntityWindow(_window);
                        _window = null;
                    };
                    _SafeStr_4031 = true;
                    _SafeStr_4027.push(this);
                };
            };
        }

        override protected function expose():void
        {
            super.expose();
            ITextWindow(_window.findChildByTag("label")).underline = exposed;
            _window.color = ((exposed) ? 9560569 : 8374494);
        }

        override protected function conceal():void
        {
            super.conceal();
            ITextWindow(_window.findChildByTag("label")).underline = exposed;
            _window.color = ((exposed) ? 9560569 : 8374494);
        }

        private function onButtonClick(_arg_1:WindowMouseEvent):void
        {
            if (((!(disposed)) && (!(recycled))))
            {
                DATA.findNewFriends();
                deselect(true);
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.tabs

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3336 = "_-TU" (String#3431, DoABC#4)
// _SafeStr_3340 = "_-d10" (String#12853, DoABC#4)
// _SafeStr_4027 = "_-r1I" (String#1329, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_6074 = "_-js" (String#5353, DoABC#4)
// _SafeStr_6075 = "_-p1m" (String#10808, DoABC#4)
// _SafeStr_8562 = "_-ST" (String#39580, DoABC#4)
// _SafeStr_8563 = "_-Fq" (String#30226, DoABC#4)
// _SafeStr_8564 = "_-x10" (String#30097, DoABC#4)
// _SafeStr_8565 = "_-Rm" (String#10674, DoABC#4)


