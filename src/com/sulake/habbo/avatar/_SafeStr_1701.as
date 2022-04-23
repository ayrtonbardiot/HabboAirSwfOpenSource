// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar._SafeStr_1701

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.avatar.structure._SafeStr_3125;
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.avatar.animation._SafeStr_3136;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;

    public /*dynamic*/ interface _SafeStr_1701 extends IUnknown 
    {

        function createAvatarImage(_arg_1:String, _arg_2:String, _arg_3:String=null, _arg_4:_SafeStr_1875=null, _arg_5:_SafeStr_3139=null):_SafeStr_3138;
        function get assets():_SafeStr_21;
        function getFigureData():_SafeStr_3125;
        function getFigureStringWithFigureIds(_arg_1:String, _arg_2:String, _arg_3:Vector.<int>):String;
        function isValidFigureSetForGender(_arg_1:int, _arg_2:String):Boolean;
        function getMandatoryAvatarPartSetIds(_arg_1:String, _arg_2:int):Array;
        function getAssetByName(_arg_1:String):IAsset;
        function get mode():String;
        function set mode(_arg_1:String):void;
        function injectFigureData(_arg_1:XML):void;
        function createFigureContainer(_arg_1:String):_SafeStr_3164;
        function isFigureReady(_arg_1:_SafeStr_3164):Boolean;
        function downloadFigure(_arg_1:_SafeStr_3164, _arg_2:_SafeStr_1875):void;
        function getAnimationManager():_SafeStr_3136;
        function get events():IEventDispatcher;
        function resetAssetManager():void;
        function resolveClubLevel(_arg_1:_SafeStr_3164, _arg_2:String, _arg_3:Array=null):int;
        function getItemIds():Array;
        function get effectMap():Dictionary;

    }
}//package com.sulake.habbo.avatar

// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3125 = "_-u1g" (String#5880, DoABC#4)
// _SafeStr_3136 = "_-q1r" (String#12537, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3139 = "_-7b" (String#5555, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)


