// by nota

//com.sulake.core.window.components.IScrollableWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface IScrollableWindow extends _SafeStr_3109 
    {

        function get scrollH():Number;
        function get scrollV():Number;
        function set scrollH(_arg_1:Number):void;
        function set scrollV(_arg_1:Number):void;
        function get scrollStepH():Number;
        function get scrollStepV():Number;
        function set scrollStepH(_arg_1:Number):void;
        function set scrollStepV(_arg_1:Number):void;
        function get maxScrollH():int;
        function get maxScrollV():int;
        function get visibleRegion():Rectangle;
        function get scrollableRegion():Rectangle;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


