// by nota

//com.sulake.habbo.friendbar.view.tabs._SafeStr_3347

package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class _SafeStr_3347 extends Tab 
    {

        protected static const ICON:String = "icon";
        protected static const HEADER:String = "header";
        private static const _SafeStr_8564:String = "new_open_messenger_tab_xml";
        private static const DEFAULT_COLOR:uint = 8374494;
        private static const _SafeStr_8565:uint = 9560569;
        private static const FRIENDS_Y_PADDING:int = 10;
        private static const _SafeStr_4027:Array = [];
        private static const _SafeStr_6074:Array = [];


        public static function allocate():_SafeStr_3347
        {
            var _local_1:_SafeStr_3347 = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (_SafeStr_3347)());
            _local_1._SafeStr_4031 = false;
            _local_1._window = _local_1.allocateEntityWindow();
            return (_local_1);
        }


        public function allocateEntityWindow():_SafeStr_3133
        {
            var _local_1:_SafeStr_3133 = ((_SafeStr_6074.length > 0) ? _SafeStr_6074.pop() : (WINDOWING.buildFromXML((ASSETS.getAssetByName("new_open_messenger_tab_xml").content as XML)) as _SafeStr_3133));
            _local_1.addEventListener("WME_CLICK", onButtonClick);
            _local_1.addEventListener("WME_OVER", onMouseOver);
            _local_1.addEventListener("WME_OUT", onMouseOut);
            _local_1.height = HEIGHT;
            return (_local_1);
        }

        private function releaseEntityWindow(_arg_1:_SafeStr_3133):void
        {
            if (((_arg_1) && (!(_arg_1.disposed))))
            {
                _arg_1.procedure = null;
                _arg_1.removeEventListener("WME_CLICK", onMouseClick);
                _arg_1.removeEventListener("WME_OVER", onMouseOver);
                _arg_1.removeEventListener("WME_OUT", onMouseOut);
                _arg_1.width = WIDTH;
                _arg_1.height = HEIGHT;
                if (_SafeStr_6074.indexOf(_arg_1) == -1)
                {
                    _SafeStr_6074.push(_arg_1);
                };
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
            _window.color = ((exposed) ? 9560569 : 8374494);
        }

        override protected function conceal():void
        {
            super.conceal();
            _window.color = ((exposed) ? 9560569 : 8374494);
        }

        private function onButtonClick(_arg_1:WindowMouseEvent):void
        {
            if (((!(disposed)) && (!(recycled))))
            {
                DATA.toggleMessenger();
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.tabs

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3347 = "_-x1I" (String#12830, DoABC#4)
// _SafeStr_4027 = "_-r1I" (String#1329, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_6074 = "_-js" (String#5353, DoABC#4)
// _SafeStr_8564 = "_-x10" (String#30097, DoABC#4)
// _SafeStr_8565 = "_-Rm" (String#10674, DoABC#4)


