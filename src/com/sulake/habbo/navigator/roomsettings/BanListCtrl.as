// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.roomsettings.BanListCtrl

package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events._SafeStr_3116;

    public class BanListCtrl extends UserListCtrl 
    {

        private var _SafeStr_5375:int = -1;

        public function BanListCtrl(_arg_1:_SafeStr_1697)
        {
            super(_arg_1, false);
        }

        override protected function getRowView():_SafeStr_3133
        {
            return (_SafeStr_3133(_navigator.getXmlWindow("ros_banned_user")));
        }

        override protected function onBgMouseClick(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_5375 = _arg_1.target.parent.id;
            refreshColorsAfterClick((_arg_1.target.findParentByName("moderation_banned_users") as IItemListWindow));
        }

        override protected function getBgColor(_arg_1:int, _arg_2:Boolean):uint
        {
            if (_arg_1 == _SafeStr_5375)
            {
                return (4288329945);
            };
            return (super.getBgColor(_arg_1, _arg_2));
        }

        private function refreshColorsAfterClick(_arg_1:IItemListWindow):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_6279)
            {
                _local_2 = _SafeStr_3133(_arg_1.getListItemAt(_local_3));
                _local_2.color = this.getBgColor(_local_3, false);
                _local_3++;
            };
        }

        public function get selectedRow():int
        {
            return (_SafeStr_5375);
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_5375 = "_-i1M" (String#6688, DoABC#4)
// _SafeStr_6279 = "_-tN" (String#5249, DoABC#4)


