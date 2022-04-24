// by nota

//com.sulake.habbo.avatar.animation.AnimationManager

package com.sulake.habbo.avatar.animation
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.AvatarStructure;

    public class AnimationManager implements _SafeStr_3136 
    {

        private var _SafeStr_6022:Dictionary;

        public function AnimationManager()
        {
            _SafeStr_6022 = new Dictionary();
        }

        public function registerAnimation(_arg_1:AvatarStructure, _arg_2:XML):Boolean
        {
            var _local_3:String = String(_arg_2.@name);
            _SafeStr_6022[_local_3] = new Animation(_arg_1, _arg_2);
            return (true);
        }

        public function getAnimation(_arg_1:String):IAnimation
        {
            return (_SafeStr_6022[_arg_1]);
        }

        public function getLayerData(_arg_1:String, _arg_2:int, _arg_3:String):_SafeStr_3274
        {
            var _local_4:Animation = (_SafeStr_6022[_arg_1] as Animation);
            if (_local_4 != null)
            {
                return (_local_4.getLayerData(_arg_2, _arg_3));
            };
            return (null);
        }

        public function get animations():Dictionary
        {
            return (_SafeStr_6022);
        }


    }
}//package com.sulake.habbo.avatar.animation

// _SafeStr_3136 = "_-q1r" (String#12537, DoABC#4)
// _SafeStr_3274 = "_-z6" (String#5709, DoABC#4)
// _SafeStr_6022 = "_-Af" (String#3543, DoABC#4)


