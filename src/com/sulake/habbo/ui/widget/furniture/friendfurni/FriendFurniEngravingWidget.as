// by nota

//com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniEngravingWidget

package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler._SafeStr_3305;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;

    public class FriendFurniEngravingWidget extends RoomWidgetBase 
    {

        private var _stuffId:int = -1;
        private var _SafeStr_4961:FriendFurniEngravingView;

        public function FriendFurniEngravingWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            engravingWidgetHandler.widget = this;
        }

        public function get stuffId():int
        {
            return (_stuffId);
        }

        public function get engravingWidgetHandler():_SafeStr_3305
        {
            return (_SafeStr_3914 as _SafeStr_3305);
        }

        public function open(_arg_1:int, _arg_2:int, _arg_3:StringArrayStuffData):void
        {
            close(_stuffId);
            _stuffId = _arg_1;
            switch (_arg_2)
            {
                case 0:
                    _SafeStr_4961 = new LoveLockEngravingView(this, _arg_3);
                    break;
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    _SafeStr_4961 = new WildWestEngravingView(this, _arg_3);
                    break;
                case 4:
                    _SafeStr_4961 = new HabboweenEngravingView(this, _arg_3);
                default:
            };
            _SafeStr_4961.open();
        }

        public function close(_arg_1:int):void
        {
            if (((_arg_1 == _stuffId) && (_SafeStr_4961)))
            {
                _SafeStr_4961.dispose();
                _SafeStr_4961 = null;
                _stuffId = -1;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.friendfurni

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3305 = "_-pV" (String#10325, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4961 = "_-R1M" (String#5912, DoABC#4)


