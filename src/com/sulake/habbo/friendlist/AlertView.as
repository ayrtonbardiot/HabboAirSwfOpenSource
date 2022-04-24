// by nota

//com.sulake.habbo.friendlist.AlertView

package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Dictionary;
    import com.sulake.core.window.components._SafeStr_3263;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class AlertView implements _SafeStr_13 
    {

        private static var _SafeStr_5507:Dictionary = new Dictionary();

        private var _friendList:HabboFriendList;
        private var _SafeStr_4581:_SafeStr_3263;
        private var _xmlFileName:String;
        private var _SafeStr_4004:String;
        private var _disposed:Boolean;

        public function AlertView(_arg_1:HabboFriendList, _arg_2:String, _arg_3:String=null)
        {
            _friendList = _arg_1;
            _xmlFileName = _arg_2;
            _SafeStr_4004 = _arg_3;
        }

        public function show():void
        {
            var _local_1:_SafeStr_3263 = _SafeStr_3263(_SafeStr_5507[_xmlFileName]);
            if (_local_1 != null)
            {
                _local_1.dispose();
            };
            _SafeStr_4581 = getAlert();
            if (_SafeStr_4004 != null)
            {
                _SafeStr_4581.caption = _SafeStr_4004;
            };
            setupContent(_SafeStr_4581.content);
            var _local_2:Rectangle = Util.getLocationRelativeTo(_friendList.view.mainWindow, _SafeStr_4581.width, _SafeStr_4581.height);
            _SafeStr_4581.x = _local_2.x;
            _SafeStr_4581.y = _local_2.y;
            _SafeStr_5507[_xmlFileName] = _SafeStr_4581;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_SafeStr_4581 != null)
            {
                _SafeStr_4581.destroy();
                _SafeStr_4581 = null;
            };
            _friendList = null;
        }

        internal function setupContent(_arg_1:_SafeStr_3133):void
        {
        }

        internal function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            dispose();
        }

        private function getAlert():_SafeStr_3263
        {
            var _local_1:_SafeStr_3263 = _SafeStr_3263(_friendList.getXmlWindow(this._xmlFileName));
            var _local_2:_SafeStr_3109 = _local_1.findChildByTag("close");
            _local_2.procedure = onClose;
            return (_local_1);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get friendList():HabboFriendList
        {
            return (_friendList);
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_4581 = "_-x16" (String#3489, DoABC#4)
// _SafeStr_5507 = "_-lp" (String#5541, DoABC#4)


