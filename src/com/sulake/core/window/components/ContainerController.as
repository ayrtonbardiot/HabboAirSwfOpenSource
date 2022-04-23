// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.ContainerController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.iterators.ContainerIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.graphics.GraphicContext;
    import com.sulake.core.window.graphics.IGraphicContext;

    public class ContainerController extends WindowController implements _SafeStr_3133 
    {

        public function ContainerController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _SafeStr_4440 = (((_background) || (testParamFlag(1))) || (!(testParamFlag(16))));
        }

        public function get iterator():IIterator
        {
            return (new ContainerIterator(this));
        }

        override public function getGraphicContext(_arg_1:Boolean):IGraphicContext
        {
            if (((_arg_1) && (!(_SafeStr_4436))))
            {
                _SafeStr_4436 = new GraphicContext((("GC {" + _name) + "}"), ((testParamFlag(16)) ? 4 : 1), rectangle);
                _SafeStr_4436.visible = _SafeStr_4426;
            };
            return (_SafeStr_4436);
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_4436 = "_-Db" (String#1744, DoABC#4)
// _SafeStr_4440 = "_-I1r" (String#4101, DoABC#4)


