// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar._SafeStr_3138

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.avatar.animation._SafeStr_3274;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.animation._SafeStr_3323;

    public /*dynamic*/ interface _SafeStr_3138 extends _SafeStr_13 
    {

        function getCroppedImage(_arg_1:String, _arg_2:Number=1):BitmapData;
        function getImage(_arg_1:String, _arg_2:Boolean, _arg_3:Number=1):BitmapData;
        function getServerRenderData():Array;
        function setDirection(_arg_1:String, _arg_2:int):void;
        function setDirectionAngle(_arg_1:String, _arg_2:int):void;
        function updateAnimationByFrames(_arg_1:int=1):void;
        function getScale():String;
        function getSprites():Vector.<ISpriteDataContainer>;
        function getLayerData(_arg_1:ISpriteDataContainer):_SafeStr_3274;
        function getAsset(_arg_1:String):BitmapDataAsset;
        function getDirection():int;
        function getFigure():_SafeStr_3164;
        function getPartColor(_arg_1:String):IPartColor;
        function isAnimating():Boolean;
        function getCanvasOffsets():Array;
        function initActionAppends():void;
        function endActionAppends():void;
        function appendAction(_arg_1:String, ... _args):Boolean;
        function get avatarSpriteData():_SafeStr_3323;
        function isPlaceholder():Boolean;
        function forceActionUpdate():void;
        function get animationHasResetOnToggle():Boolean;
        function resetAnimationFrameCounter():void;
        function get mainAction():String;

    }
}//package com.sulake.habbo.avatar

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3274 = "_-z6" (String#5709, DoABC#4)
// _SafeStr_3323 = "_-o1w" (String#8055, DoABC#4)


