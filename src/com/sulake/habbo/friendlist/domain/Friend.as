// by nota

//com.sulake.habbo.friendlist.domain.Friend

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist._SafeStr_3173;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import _-JS._SafeStr_1600;

    public class Friend implements _SafeStr_3173, _SafeStr_13 
    {

        public static const GENDER_FEMALE:int = "F".charCodeAt(0);
        public static const GENDER_MALE:int = "M".charCodeAt(0);

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_3834:int;
        private var _online:Boolean;
        private var _SafeStr_4879:Boolean;
        private var _SafeStr_3819:String;
        private var _SafeStr_4880:String;
        private var _SafeStr_4881:String;
        private var _SafeStr_4674:int;
        private var _selected:Boolean;
        private var _disposed:Boolean;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_4536:BitmapData;
        private var _realName:String;
        private var _SafeStr_4882:Boolean;
        private var _SafeStr_4883:Boolean;
        private var _SafeStr_4884:Boolean;
        private var _relationshipStatus:int;

        public function Friend(_arg_1:_SafeStr_1600)
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_3820 = _arg_1.id;
            _name = _arg_1.name;
            _SafeStr_3834 = _arg_1.gender;
            _online = _arg_1.online;
            _SafeStr_4879 = ((_arg_1.followingAllowed) && (_arg_1.online));
            _SafeStr_3819 = _arg_1.figure;
            _SafeStr_4880 = _arg_1.motto;
            _SafeStr_4881 = _arg_1.lastAccess;
            _SafeStr_4674 = _arg_1.categoryId;
            _realName = _arg_1.realName;
            _SafeStr_4882 = _arg_1.persistedMessageUser;
            _SafeStr_4884 = _arg_1.vipMember;
            _SafeStr_4883 = _arg_1.pocketHabboUser;
            _relationshipStatus = _arg_1.relationshipStatus;
            _SafeStr_14.log(((((((((((((("Creating friend: " + id) + ", ") + name) + ", ") + gender) + ", ") + online) + ", ") + followingAllowed) + ", ") + figure) + ", ") + categoryId));
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (_SafeStr_4536 != null)
            {
                _SafeStr_4536.dispose();
                _SafeStr_4536 = null;
            };
            _disposed = true;
            _SafeStr_3882 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get gender():int
        {
            return (_SafeStr_3834);
        }

        public function get online():Boolean
        {
            return (_online);
        }

        public function get followingAllowed():Boolean
        {
            return (_SafeStr_4879);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }

        public function get lastAccess():String
        {
            return (_SafeStr_4881);
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function get view():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function get face():BitmapData
        {
            return (_SafeStr_4536);
        }

        public function get realName():String
        {
            return (_realName);
        }

        public function get persistedMessageUser():Boolean
        {
            return (_SafeStr_4882);
        }

        public function get pocketHabboUser():Boolean
        {
            return (_SafeStr_4883);
        }

        public function get relationshipStatus():int
        {
            return (_relationshipStatus);
        }

        public function get vipMember():Boolean
        {
            return (_SafeStr_4884);
        }

        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function set gender(_arg_1:int):void
        {
            _SafeStr_3834 = _arg_1;
        }

        public function set online(_arg_1:Boolean):void
        {
            _online = _arg_1;
        }

        public function set followingAllowed(_arg_1:Boolean):void
        {
            _SafeStr_4879 = _arg_1;
        }

        public function set figure(_arg_1:String):void
        {
            _SafeStr_3819 = _arg_1;
        }

        public function set motto(_arg_1:String):void
        {
            _SafeStr_4880 = _arg_1;
        }

        public function set lastAccess(_arg_1:String):void
        {
            _SafeStr_4881 = _arg_1;
        }

        public function set categoryId(_arg_1:int):void
        {
            _SafeStr_4674 = _arg_1;
        }

        public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
        }

        public function set view(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_3882 = _arg_1;
        }

        public function set face(_arg_1:BitmapData):void
        {
            _SafeStr_4536 = _arg_1;
        }

        public function set realName(_arg_1:String):void
        {
            _realName = _arg_1;
        }

        public function set persistedMessageUser(_arg_1:Boolean):void
        {
            _SafeStr_4882 = _arg_1;
        }

        public function set pocketHabboUser(_arg_1:Boolean):void
        {
            _SafeStr_4883 = _arg_1;
        }

        public function set vipMember(_arg_1:Boolean):void
        {
            _SafeStr_4884 = _arg_1;
        }

        public function isGroupFriend():Boolean
        {
            return (_SafeStr_3820 < 0);
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1600 = "_-Cu" (String#6879, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3173 = "_-o3" (String#6682, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4536 = "_-61A" (String#2935, DoABC#4)
// _SafeStr_4674 = "_-k10" (String#2944, DoABC#4)
// _SafeStr_4879 = "_-W1k" (String#12357, DoABC#4)
// _SafeStr_4880 = "_-v1" (String#3385, DoABC#4)
// _SafeStr_4881 = "_-u1c" (String#6230, DoABC#4)
// _SafeStr_4882 = "_-H18" (String#13349, DoABC#4)
// _SafeStr_4883 = "_-M1n" (String#13473, DoABC#4)
// _SafeStr_4884 = "_-TR" (String#11754, DoABC#4)


