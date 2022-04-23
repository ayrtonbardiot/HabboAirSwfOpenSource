// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.ActivatorController

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ActivatorController extends ContainerController 
    {

        protected var _SafeStr_6161:_SafeStr_3109;

        public function ActivatorController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            if (_arg_2.type == "WE_CHILD_ACTIVATED")
            {
                setActiveChild((_arg_1 as _SafeStr_3109));
            }
            else
            {
                if (_arg_2.type == "WE_PARENT_ACTIVATED")
                {
                    return (true);
                };
            };
            return (super.update(_arg_1, _arg_2));
        }

        public function getActiveChild():_SafeStr_3109
        {
            return (_SafeStr_6161);
        }

        public function setActiveChild(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            if (_arg_1.parent != this)
            {
                while (true)
                {
                    _arg_1 = _arg_1.parent;
                    if (_arg_1 == null)
                    {
                        throw (new Error("Window passed to activator is not a child!"));
                    };
                    if (_arg_1.parent == this) break;
                };
            };
            var _local_2:_SafeStr_3109 = _SafeStr_6161;
            if (_SafeStr_6161 != _arg_1)
            {
                if (_SafeStr_6161 != null)
                {
                    if (!_SafeStr_6161.disposed)
                    {
                        _SafeStr_6161.deactivate();
                    };
                };
                _SafeStr_6161 = _arg_1;
                if (getChildIndex(_arg_1) != (numChildren - 1))
                {
                    setChildIndex(_arg_1, (numChildren - 1));
                };
            };
            return (_local_2);
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_6161 = "_-iO" (String#8559, DoABC#4)


