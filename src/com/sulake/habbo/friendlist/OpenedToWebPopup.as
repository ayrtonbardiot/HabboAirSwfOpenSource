// by nota

//com.sulake.habbo.friendlist.OpenedToWebPopup

package com.sulake.habbo.friendlist
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import flash.events.Event;

    public class OpenedToWebPopup 
    {

        private var _friendList:HabboFriendList;
        private var _SafeStr_4581:_SafeStr_3133;
        private var _SafeStr_4582:Timer;

        public function OpenedToWebPopup(_arg_1:HabboFriendList)
        {
            _friendList = _arg_1;
        }

        public function show(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_4581 != null)
            {
                close(null);
            };
            _SafeStr_4581 = getOpenedToWebAlert();
            if (_SafeStr_4582 != null)
            {
                _SafeStr_4582.stop();
            };
            _SafeStr_4582 = new Timer(2000, 1);
            _SafeStr_4582.addEventListener("timer", close);
            _SafeStr_4582.start();
            _SafeStr_4581.x = _arg_1;
            _SafeStr_4581.y = _arg_2;
        }

        private function close(_arg_1:Event):void
        {
            _SafeStr_4581.destroy();
            _SafeStr_4581 = null;
        }

        private function getOpenedToWebAlert():_SafeStr_3133
        {
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_friendList.getXmlWindow("opened_to_web_popup"));
            _friendList.refreshButton(_local_1, "opened_to_web", true, null, 0);
            return (_local_1);
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4581 = "_-x16" (String#3489, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)


