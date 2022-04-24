// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents._SafeStr_3285

package com.sulake.habbo.roomevents.userdefinedroomevents
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import _-l12._SafeStr_1554;

    public /*dynamic*/ interface _SafeStr_3285 
    {

        function get code():int;
        function get negativeCode():int;
        function get requiresFurni():int;
        function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void;
        function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void;
        function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array;
        function readStringParamFromForm(_arg_1:_SafeStr_3133):String;
        function get hasSpecialInputs():Boolean;
        function get hasStateSnapshot():Boolean;
        function validate(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):String;

    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3285 = "_-j1k" (String#3139, DoABC#4)


