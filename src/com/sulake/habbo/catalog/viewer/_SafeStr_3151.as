// by nota

//com.sulake.habbo.catalog.viewer._SafeStr_3151

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3133;

    public /*dynamic*/ interface _SafeStr_3151 extends _SafeStr_3140, _SafeStr_13 
    {

        function get productType():String;
        function get productClassId():int;
        function set extraParam(_arg_1:String):void;
        function get extraParam():String;
        function get productCount():int;
        function get productData():_SafeStr_3182;
        function get furnitureData():_SafeStr_3130;
        function get isUniqueLimitedItem():Boolean;
        function get isColorable():Boolean;
        function get uniqueLimitedItemSeriesSize():int;
        function get uniqueLimitedItemsLeft():int;
        function set uniqueLimitedItemsLeft(_arg_1:int):void;
        function initIcon(_arg_1:_SafeStr_3300, _arg_2:_SafeStr_3140=null, _arg_3:_SafeStr_1875=null, _arg_4:_SafeStr_3141=null, _arg_5:_SafeStr_3264=null, _arg_6:IStuffData=null, _arg_7:Function=null):BitmapData;
        function set view(_arg_1:_SafeStr_3133):void;
        function set grid(_arg_1:IItemGrid):void;

    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)


