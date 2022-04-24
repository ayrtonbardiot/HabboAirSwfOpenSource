// by nota

//com.sulake.core.window.graphics.renderer.ISkinRenderer

package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface ISkinRenderer extends _SafeStr_13 
    {

        function get name():String;
        function parse(_arg_1:IAsset, _arg_2:XMLList, _arg_3:_SafeStr_21):void;
        function draw(_arg_1:_SafeStr_3109, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void;
        function isStateDrawable(_arg_1:uint):Boolean;
        function addLayout(_arg_1:ISkinLayout):ISkinLayout;
        function getLayoutByName(_arg_1:String):ISkinLayout;
        function removeLayout(_arg_1:ISkinLayout):ISkinLayout;
        function getLayoutByState(_arg_1:uint):ISkinLayout;
        function registerLayoutForRenderState(_arg_1:uint, _arg_2:String):void;
        function removeLayoutFromRenderState(_arg_1:uint):void;
        function hasLayoutForState(_arg_1:uint):Boolean;
        function addTemplate(_arg_1:ISkinTemplate):ISkinTemplate;
        function getTemplateByName(_arg_1:String):ISkinTemplate;
        function removeTemplate(_arg_1:ISkinTemplate):ISkinTemplate;
        function getTemplateByState(_arg_1:uint):ISkinTemplate;
        function registerTemplateForRenderState(_arg_1:uint, _arg_2:String):void;
        function removeTemplateFromRenderState(_arg_1:uint):void;
        function hasTemplateForState(_arg_1:uint):Boolean;

    }
}//package com.sulake.core.window.graphics.renderer

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


