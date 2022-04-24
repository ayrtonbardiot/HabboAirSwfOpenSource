// by nota

//com.sulake.core.window.components.ContainerButtonController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.iterators.ContainerIterator;
    import com.sulake.core.window.utils.IIterator;

    public class ContainerButtonController extends InteractiveController implements _SafeStr_3240 
    {

        public function ContainerButtonController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get iterator():IIterator
        {
            return (new ContainerIterator(this));
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)


