// by nota

//com.sulake.habbo.ui.widget.roomtools.RoomToolsHistory

package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
    import __AS3__.vec.Vector;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class RoomToolsHistory 
    {

        private static const PADDING:int = 5;
        private static const SPACING:int = 2;

        private var _windowManager:_SafeStr_1695;
        private var _assets:_SafeStr_21;
        private var _window:_SafeStr_3133;
        private var _SafeStr_3914:RoomToolsWidgetHandler;
        private var _items:Vector.<_SafeStr_3133> = new Vector.<_SafeStr_3133>();

        public function RoomToolsHistory(_arg_1:_SafeStr_1695, _arg_2:_SafeStr_21, _arg_3:RoomToolsWidgetHandler)
        {
            _SafeStr_3914 = _arg_3;
            _assets = _arg_2;
            _windowManager = _arg_1;
            _window = (_arg_1.buildFromXML((_arg_2.getAssetByName("room_tools_history_xml").content as XML)) as _SafeStr_3133);
        }

        public function populate(_arg_1:Vector.<_SafeStr_1569>):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            for each (var _local_4:_SafeStr_1569 in _arg_1)
            {
                _local_2 = (_windowManager.buildFromXML((_assets.getAssetByName("room_tools_history_item_xml").content as XML)) as _SafeStr_3133);
                _window.addChild(_local_2);
                _local_2.findChildByName("room_name").caption = _local_4.roomName;
                if (_local_3)
                {
                    _local_2.y = (_local_3.bottom + 2);
                }
                else
                {
                    _local_2.y = 5;
                };
                _local_2.x = 5;
                _local_2.id = _local_4.flatId;
                _local_2.procedure = onClick;
                _local_3 = _local_2;
                _items.push(_local_2);
            };
            if (_local_3)
            {
                _window.height = (_local_3.bottom + (2 * 5));
            };
        }

        public function dispose():void
        {
            for each (var _local_1:_SafeStr_3133 in _items)
            {
                _local_1.procedure = null;
                _local_1.dispose();
            };
            _items = null;
            _windowManager = null;
            _SafeStr_3914 = null;
            _assets = null;
            _window.dispose();
            _window = null;
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_3914.goToPrivateRoom(_arg_2.id);
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.ui.widget.roomtools

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)


