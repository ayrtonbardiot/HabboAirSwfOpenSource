// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.data.FriendEntity

package com.sulake.habbo.friendbar.data
{
    import __AS3__.vec.Vector;

    public class FriendEntity implements _SafeStr_3377 
    {

        private static var ROLLING_LOG_EVENT_ID:int = 0;

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_3834:int;
        private var _online:Boolean;
        private var _allowFollow:Boolean;
        private var _SafeStr_3819:String;
        private var _SafeStr_4674:int;
        private var _SafeStr_4880:String;
        private var _SafeStr_4881:String;
        private var _realName:String;
        private var _notifications:Vector.<IFriendNotification>;
        private var _SafeStr_6402:int = -1;

        public function FriendEntity(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:int, _arg_6:Boolean, _arg_7:Boolean, _arg_8:String, _arg_9:int, _arg_10:String)
        {
            _SafeStr_3820 = _arg_1;
            _name = _arg_2;
            _realName = _arg_3;
            _SafeStr_4880 = _arg_4;
            _SafeStr_3834 = _arg_5;
            _online = _arg_6;
            _allowFollow = _arg_7;
            _SafeStr_3819 = _arg_8;
            _SafeStr_4674 = _arg_9;
            _SafeStr_4881 = _arg_10;
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

        public function get allowFollow():Boolean
        {
            return (_allowFollow);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }

        public function get lastAccess():String
        {
            return (_SafeStr_4881);
        }

        public function get realName():String
        {
            return (_realName);
        }

        public function get logEventId():int
        {
            return (_SafeStr_6402);
        }

        public function get notifications():Vector.<IFriendNotification>
        {
            if (!_notifications)
            {
                _notifications = new Vector.<IFriendNotification>();
            };
            return (_notifications);
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

        public function set allowFollow(_arg_1:Boolean):void
        {
            _allowFollow = _arg_1;
        }

        public function set figure(_arg_1:String):void
        {
            _SafeStr_3819 = _arg_1;
        }

        public function set categoryId(_arg_1:int):void
        {
            _SafeStr_4674 = _arg_1;
        }

        public function set motto(_arg_1:String):void
        {
            _SafeStr_4880 = _arg_1;
        }

        public function set lastAccess(_arg_1:String):void
        {
            _SafeStr_4881 = _arg_1;
        }

        public function set realName(_arg_1:String):void
        {
            _realName = _arg_1;
        }

        public function set logEventId(_arg_1:int):void
        {
            _SafeStr_6402 = _arg_1;
        }

        public function getNextLogEventId():int
        {
            return (++ROLLING_LOG_EVENT_ID);
        }


    }
}//package com.sulake.habbo.friendbar.data

// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4674 = "_-k10" (String#2944, DoABC#4)
// _SafeStr_4880 = "_-v1" (String#3385, DoABC#4)
// _SafeStr_4881 = "_-u1c" (String#6230, DoABC#4)
// _SafeStr_6402 = "_-H1w" (String#22547, DoABC#4)


