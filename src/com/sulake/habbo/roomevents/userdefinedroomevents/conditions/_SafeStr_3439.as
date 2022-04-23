// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3439

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class _SafeStr_3439 extends DefaultConditionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3488.STUFF_TYPE_MATCHES);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488.NOT_STUFF_TYPE_MATCHES);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_3439 = "_-68" (String#14934, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)


