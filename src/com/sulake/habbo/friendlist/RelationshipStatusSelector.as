// by nota

//com.sulake.habbo.friendlist.RelationshipStatusSelector

package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3195;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class RelationshipStatusSelector implements _SafeStr_13 
    {

        private var _friendList:HabboFriendList;
        private var _window:_SafeStr_3195;
        private var _SafeStr_5407:int;
        private var _disposed:Boolean = false;

        public function RelationshipStatusSelector(_arg_1:HabboFriendList)
        {
            _friendList = _arg_1;
            createWindow();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                destroyWindow();
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function appearAt(_arg_1:_SafeStr_3109, _arg_2:_SafeStr_3109):void
        {
            var _local_3:Point = new Point();
            _arg_1.getGlobalPosition(_local_3);
            _window.x = _local_3.x;
            _window.y = _local_3.y;
            _window.visible = true;
            _window.activate();
        }

        public function disappear():void
        {
            _window.visible = false;
        }

        public function set friendId(_arg_1:int):void
        {
            _SafeStr_5407 = _arg_1;
        }

        private function createWindow():void
        {
            _window = _SafeStr_3195(_friendList.windowManager.buildFromXML(XML(_friendList.assets.getAssetByName("relationship_chooser_xml").content)));
            _window.procedure = onWindowEvent;
            _window.visible = false;
        }

        private function destroyWindow():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "item_none":
                        _friendList.setRelationshipStatus(_SafeStr_5407, 0);
                        break;
                    case "item_heart":
                        _friendList.setRelationshipStatus(_SafeStr_5407, 1);
                        break;
                    case "item_smile":
                        _friendList.setRelationshipStatus(_SafeStr_5407, 2);
                        break;
                    case "item_bobba":
                        _friendList.setRelationshipStatus(_SafeStr_5407, 3);
                };
                _window.visible = false;
            };
            if (_arg_1.type == "WE_UNFOCUSED")
            {
                _window.visible = false;
            };
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_5407 = "_-c3" (String#6830, DoABC#4)


