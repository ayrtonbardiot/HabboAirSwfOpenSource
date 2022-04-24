// by nota

//com.sulake.habbo.avatar.animation.AnimationLayerData

package com.sulake.habbo.avatar.animation
{
    import com.sulake.habbo.avatar.actions._SafeStr_3292;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.avatar.actions.ActiveActionData;
    import com.sulake.habbo.avatar.actions.IActionDefinition;

    public class AnimationLayerData implements _SafeStr_3274 
    {

        public static const _SafeStr_8261:String = "bodypart";
        public static const _SafeStr_8262:String = "fx";

        private var _SafeStr_3820:String;
        private var _action:_SafeStr_3292;
        private var _animationFrame:int;
        private var _SafeStr_5651:int;
        private var _SafeStr_5652:int;
        private var _SafeStr_5653:int;
        private var _directionOffset:int;
        private var _SafeStr_4028:String;
        private var _SafeStr_5650:String;
        private var _items:_SafeStr_24 = new _SafeStr_24();

        public function AnimationLayerData(_arg_1:XML, _arg_2:String, _arg_3:IActionDefinition)
        {
            _SafeStr_3820 = String(_arg_1.@id);
            _animationFrame = parseInt(_arg_1.@frame);
            _SafeStr_5651 = parseInt(_arg_1.@dx);
            _SafeStr_5652 = parseInt(_arg_1.@dy);
            _SafeStr_5653 = parseInt(_arg_1.@dz);
            _directionOffset = parseInt(_arg_1.@dd);
            _SafeStr_4028 = _arg_2;
            _SafeStr_5650 = String(_arg_1.@base);
            for each (var _local_5:XML in _arg_1.item)
            {
                _items[String(_local_5.@id)] = String(_local_5.@base);
            };
            var _local_4:String = "";
            if (_SafeStr_5650 != "")
            {
                _local_4 = String(baseAsInt());
            };
            if (_arg_3 != null)
            {
                _action = new ActiveActionData(_arg_3.state, base);
                _action.definition = _arg_3;
            };
        }

        public function get items():_SafeStr_24
        {
            return (_items);
        }

        private function baseAsInt():int
        {
            var _local_1:int;
            var _local_2:int;
            _local_1 = 0;
            while (_local_1 < _SafeStr_5650.length)
            {
                _local_2 = (_local_2 + _SafeStr_5650.charCodeAt(_local_1));
                _local_1++;
            };
            return (_local_2);
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get animationFrame():int
        {
            return (_animationFrame);
        }

        public function get dx():int
        {
            return (_SafeStr_5651);
        }

        public function get dy():int
        {
            return (_SafeStr_5652);
        }

        public function get dz():int
        {
            return (_SafeStr_5653);
        }

        public function get directionOffset():int
        {
            return (_directionOffset);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get base():String
        {
            return (_SafeStr_5650);
        }

        public function get action():_SafeStr_3292
        {
            return (_action);
        }


    }
}//package com.sulake.habbo.avatar.animation

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3274 = "_-z6" (String#5709, DoABC#4)
// _SafeStr_3292 = "_-91r" (String#2734, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_5650 = "_-u1r" (String#6565, DoABC#4)
// _SafeStr_5651 = "_-D1T" (String#7828, DoABC#4)
// _SafeStr_5652 = "_-h1z" (String#7680, DoABC#4)
// _SafeStr_5653 = "_-K1y" (String#7249, DoABC#4)
// _SafeStr_8261 = "_-8W" (String#38736, DoABC#4)
// _SafeStr_8262 = "_-y4" (String#34577, DoABC#4)


