// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent

package com.sulake.habbo.session.events
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserDataUpdateEvent extends RoomSessionEvent 
    {

        public static const USER_DATA_UPDATED:String = "rsudue_user_data_updated";

        private var _addedUsers:Vector.<_SafeStr_3241>;

        public function RoomSessionUserDataUpdateEvent(_arg_1:IRoomSession, _arg_2:Vector.<_SafeStr_3241>, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("rsudue_user_data_updated", _arg_1, _arg_3, _arg_4);
            _addedUsers = _arg_2;
        }

        public function get addedUsers():Vector.<_SafeStr_3241>
        {
            return (_addedUsers);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)


