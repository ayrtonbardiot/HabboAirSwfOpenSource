// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3457

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class _SafeStr_3457 extends DefaultActionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3485.TOGGLE_FURNI_STATE);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_3457 = "_-Es" (String#13880, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)


