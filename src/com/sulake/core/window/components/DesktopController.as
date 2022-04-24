// by nota

//com.sulake.core.window.components.DesktopController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.graphics.GraphicContext;
    import com.sulake.core.window.graphics.IGraphicContext;
    import flash.display.DisplayObject;
    import com.sulake.core.window.events._SafeStr_3116;

    public class DesktopController extends ActivatorController implements _SafeStr_3216, _SafeStr_3189 
    {

        public function DesktopController(_arg_1:String, _arg_2:WindowContext, _arg_3:Rectangle)
        {
            super(_arg_1, 0, 0, 0, _arg_2, _arg_3, null, defaultProcedure, null, null, 0);
        }

        public function get mouseX():int
        {
            return (getDisplayObject().stage.mouseX);
        }

        public function get mouseY():int
        {
            return (getDisplayObject().stage.mouseY);
        }

        override public function set parent(_arg_1:_SafeStr_3109):void
        {
            throw (new Error("Desktop window doesn't have parent!"));
        }

        override public function set procedure(_arg_1:Function):void
        {
            _SafeStr_4437 = ((_arg_1 != null) ? _arg_1 : defaultProcedure);
        }

        override public function get host():_SafeStr_3109
        {
            return (this);
        }

        override public function get desktop():_SafeStr_3216
        {
            return (this);
        }

        override public function getGraphicContext(_arg_1:Boolean):IGraphicContext
        {
            if (((_arg_1) && (!(_SafeStr_4436))))
            {
                _SafeStr_4436 = new GraphicContext((("GC {" + _name) + "}"), 0x0100, rectangle);
                GraphicContext(_SafeStr_4436).mouseEnabled = true;
                GraphicContext(_SafeStr_4436).doubleClickEnabled = true;
            };
            return (_SafeStr_4436);
        }

        public function getActiveWindow():_SafeStr_3109
        {
            return (getActiveChild());
        }

        public function setActiveWindow(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            return (setActiveChild(_arg_1));
        }

        public function getDisplayObject():DisplayObject
        {
            return (getGraphicContext(true) as DisplayObject);
        }

        public function setDisplayObject(_arg_1:DisplayObject):void
        {
            getGraphicContext(true).setDisplayObject(_arg_1);
        }

        override public function invalidate(_arg_1:Rectangle=null):void
        {
        }

        private function defaultProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_4436 = "_-Db" (String#1744, DoABC#4)
// _SafeStr_4437 = "_-mM" (String#6108, DoABC#4)


