// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.graphics.ISkinContainer

package com.sulake.core.window.graphics
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.graphics.renderer.ISkinRenderer;
    import com.sulake.core.window.utils.DefaultAttStruct;

    public /*dynamic*/ interface ISkinContainer extends _SafeStr_13 
    {

        function getSkinRendererByTypeAndStyle(_arg_1:uint, _arg_2:uint):ISkinRenderer;
        function getDefaultAttributesByTypeAndStyle(_arg_1:uint, _arg_2:uint):DefaultAttStruct;
        function getTheActualState(_arg_1:uint, _arg_2:uint, _arg_3:uint):uint;

    }
}//package com.sulake.core.window.graphics

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)


