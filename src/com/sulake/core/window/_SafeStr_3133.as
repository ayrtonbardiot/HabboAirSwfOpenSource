// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window._SafeStr_3133

package com.sulake.core.window
{
    import com.sulake.core.window.utils.IIterable;
    import flash.geom.Point;

    public /*dynamic*/ interface _SafeStr_3133 extends _SafeStr_3109, IIterable 
    {

        function get numChildren():int;
        function addChild(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function addChildAt(_arg_1:_SafeStr_3109, _arg_2:int):_SafeStr_3109;
        function getChildAt(_arg_1:int):_SafeStr_3109;
        function getChildByID(_arg_1:int):_SafeStr_3109;
        function getChildByTag(_arg_1:String):_SafeStr_3109;
        function getChildByName(_arg_1:String):_SafeStr_3109;
        function getChildIndex(_arg_1:_SafeStr_3109):int;
        function findChildByTag(_arg_1:String):_SafeStr_3109;
        function findChildByName(_arg_1:String):_SafeStr_3109;
        function removeChild(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function removeChildAt(_arg_1:int):_SafeStr_3109;
        function setChildIndex(_arg_1:_SafeStr_3109, _arg_2:int):void;
        function swapChildren(_arg_1:_SafeStr_3109, _arg_2:_SafeStr_3109):void;
        function swapChildrenAt(_arg_1:int, _arg_2:int):void;
        function groupChildrenWithID(_arg_1:uint, _arg_2:Array, _arg_3:int=0):uint;
        function groupChildrenWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
        function getChildUnderPoint(_arg_1:Point):_SafeStr_3109;
        function groupChildrenUnderPoint(_arg_1:Point, _arg_2:Array):void;

    }
}//package com.sulake.core.window

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


