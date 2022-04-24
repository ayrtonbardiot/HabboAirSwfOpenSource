// by nota

//com.sulake.habbo.avatar.structure.figure.ISetType

package com.sulake.habbo.avatar.structure.figure
{
    import com.sulake.core.utils._SafeStr_24;

    public /*dynamic*/ interface ISetType 
    {

        function getPartSet(_arg_1:int):_SafeStr_3177;
        function isMandatory(_arg_1:String, _arg_2:int):Boolean;
        function optionalFromClubLevel(_arg_1:String):int;
        function get type():String;
        function get paletteID():int;
        function get partSets():_SafeStr_24;

    }
}//package com.sulake.habbo.avatar.structure.figure

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)


