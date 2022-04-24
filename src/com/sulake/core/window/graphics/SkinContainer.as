// by nota

//com.sulake.core.window.graphics.SkinContainer

package com.sulake.core.window.graphics
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.graphics.renderer.ISkinRenderer;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import com.sulake.core.window.graphics.renderer.*;

    public class SkinContainer implements ISkinContainer 
    {

        private static const MAX_STYLE_COUNT:uint = 100;

        protected static var statesByRenderPriority:Array;

        private var _disposed:Boolean = false;
        private var _SafeStr_4798:Dictionary;
        private var _SafeStr_4799:Dictionary;
        private var _SafeStr_4800:Dictionary;
        private var _SafeStr_4801:Dictionary;

        public function SkinContainer()
        {
            _SafeStr_4798 = new Dictionary();
            _SafeStr_4799 = new Dictionary();
            _SafeStr_4800 = new Dictionary();
            _SafeStr_4801 = new Dictionary();
            if (statesByRenderPriority == null)
            {
                statesByRenderPriority = [];
                statesByRenderPriority.push(64);
                statesByRenderPriority.push(32);
                statesByRenderPriority.push(16);
                statesByRenderPriority.push(8);
                statesByRenderPriority.push(4);
                statesByRenderPriority.push(2);
                statesByRenderPriority.push(1);
                statesByRenderPriority.push(0);
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            _SafeStr_4798 = null;
            _SafeStr_4799 = null;
            _SafeStr_4800 = null;
            _SafeStr_4801 = null;
            _disposed = true;
        }

        public function addSkinRenderer(_arg_1:uint, _arg_2:uint, _arg_3:String, _arg_4:ISkinRenderer, _arg_5:XML, _arg_6:DefaultAttStruct):void
        {
            if (_SafeStr_4798[_arg_1] == null)
            {
                _SafeStr_4798[_arg_1] = new Array(100);
            };
            _SafeStr_4798[_arg_1][_arg_2] = _arg_4;
            if (_SafeStr_4799[_arg_1] == null)
            {
                _SafeStr_4799[_arg_1] = new Array(100);
            };
            _SafeStr_4799[_arg_1][_arg_2] = _arg_6;
            if (_SafeStr_4800[_arg_1] == null)
            {
                _SafeStr_4800[_arg_1] = new Array(100);
            };
            _SafeStr_4800[_arg_1][_arg_2] = _arg_5;
            if (_SafeStr_4801[_arg_1] == null)
            {
                _SafeStr_4801[_arg_1] = new Array(100);
            };
            _SafeStr_4801[_arg_1][_arg_2] = (((!(_arg_3 == null)) && (_arg_3.length > 0)) ? _arg_3 : _arg_2.toString());
        }

        public function getSkinRendererByTypeAndStyle(_arg_1:uint, _arg_2:uint):ISkinRenderer
        {
            var _local_3:* = null;
            var _local_4:Array = _SafeStr_4798[_arg_1];
            if (_local_4)
            {
                _local_3 = _local_4[_arg_2];
                if (((!(_local_3)) && (!(_arg_2 == 0))))
                {
                    _local_3 = _local_4[0];
                };
            };
            return (_local_3);
        }

        public function skinRendererExists(_arg_1:uint, _arg_2:uint):Boolean
        {
            return ((_SafeStr_4798[_arg_1]) && (_SafeStr_4798[_arg_1][_arg_2]));
        }

        public function getDefaultAttributesByTypeAndStyle(_arg_1:uint, _arg_2:uint):DefaultAttStruct
        {
            var _local_3:* = null;
            var _local_4:Array = _SafeStr_4799[_arg_1];
            if (_local_4)
            {
                _local_3 = _local_4[_arg_2];
                if (((!(_local_3)) && (!(_arg_2 == 0))))
                {
                    _local_3 = _local_4[0];
                };
            };
            return (_local_3);
        }

        public function getWindowLayoutByTypeAndStyle(_arg_1:uint, _arg_2:uint):XML
        {
            var _local_3:Array = _SafeStr_4800[_arg_1];
            if (_local_3 == null)
            {
                return (null);
            };
            if (_local_3[_arg_2] == null)
            {
                return (_local_3[0]);
            };
            return (_local_3[_arg_2]);
        }

        public function getIntentByTypeAndStyle(_arg_1:uint, _arg_2:uint):String
        {
            var _local_3:Array = _SafeStr_4801[_arg_1];
            return (((!(_local_3 == null)) && (!(_local_3[_arg_2] == null))) ? _local_3[_arg_2] : null);
        }

        public function getTheActualState(_arg_1:uint, _arg_2:uint, _arg_3:uint):uint
        {
            var _local_5:uint;
            var _local_4:ISkinRenderer = getSkinRendererByTypeAndStyle(_arg_1, _arg_2);
            if (_local_4)
            {
                for each (_local_5 in statesByRenderPriority)
                {
                    if ((_arg_3 & _local_5) == _local_5)
                    {
                        if (_local_4.isStateDrawable(_local_5))
                        {
                            return (_local_5);
                        };
                    };
                };
            };
            return (0);
        }


    }
}//package com.sulake.core.window.graphics

// _SafeStr_4798 = "_-6M" (String#6647, DoABC#4)
// _SafeStr_4799 = "_-HK" (String#8392, DoABC#4)
// _SafeStr_4800 = "_-tc" (String#8648, DoABC#4)
// _SafeStr_4801 = "_-B1G" (String#8588, DoABC#4)


