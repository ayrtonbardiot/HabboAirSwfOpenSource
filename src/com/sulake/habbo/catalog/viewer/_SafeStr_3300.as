// by nota

//com.sulake.habbo.catalog.viewer._SafeStr_3300

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog._SafeStr_3141;

    public /*dynamic*/ interface _SafeStr_3300 extends _SafeStr_13 
    {

        function initProductIcon(_arg_1:IRoomEngine, _arg_2:IStuffData=null):void;
        function activate():void;
        function get products():Vector.<_SafeStr_3151>;
        function get firstProduct():_SafeStr_3151;
        function set view(_arg_1:_SafeStr_3133):void;
        function get view():_SafeStr_3133;
        function set grid(_arg_1:IItemGrid):void;
        function setClubIconLevel(_arg_1:int):void;
        function get offer():_SafeStr_3141;

    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)


