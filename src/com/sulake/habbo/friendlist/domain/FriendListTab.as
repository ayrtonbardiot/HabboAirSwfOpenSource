// by nota

//com.sulake.habbo.friendlist.domain.FriendListTab

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.ITabView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendlist.HabboFriendList;

    public class FriendListTab 
    {

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _footerName:String;
        private var _headerPicName:String;
        private var _SafeStr_4702:ITabView;
        private var _SafeStr_4703:Boolean;
        private var _selected:Boolean;
        private var _SafeStr_3882:_SafeStr_3133;

        public function FriendListTab(_arg_1:HabboFriendList, _arg_2:int, _arg_3:ITabView, _arg_4:String, _arg_5:String, _arg_6:String)
        {
            _SafeStr_3820 = _arg_2;
            _name = _arg_4;
            _SafeStr_4702 = _arg_3;
            _footerName = _arg_5;
            _headerPicName = _arg_6;
            _SafeStr_4702.init(_arg_1);
        }

        public function setSelected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _SafeStr_4703 = false;
            };
            _selected = _arg_1;
        }

        public function setNewMessageArrived(_arg_1:Boolean):void
        {
            if (selected)
            {
                _SafeStr_4703 = false;
            }
            else
            {
                _SafeStr_4703 = _arg_1;
            };
        }

        public function get newMessageArrived():Boolean
        {
            return (_SafeStr_4703);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get footerName():String
        {
            return (_footerName);
        }

        public function get headerPicName():String
        {
            return (_headerPicName);
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function get tabView():ITabView
        {
            return (_SafeStr_4702);
        }

        public function get view():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function set view(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_3882 = _arg_1;
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4702 = "_-Bd" (String#14109, DoABC#4)
// _SafeStr_4703 = "_-b1P" (String#9569, DoABC#4)


