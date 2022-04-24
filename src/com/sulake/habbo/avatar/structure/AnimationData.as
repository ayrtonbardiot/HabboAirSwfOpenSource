﻿// by nota

//com.sulake.habbo.avatar.structure.AnimationData

package com.sulake.habbo.avatar.structure
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.animation.AnimationAction;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.habbo.avatar.structure.animation.*;

    public class AnimationData implements IStructureData 
    {

        private var _SafeStr_4249:Dictionary;

        public function AnimationData()
        {
            _SafeStr_4249 = new Dictionary();
        }

        public function parse(_arg_1:XML):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            for each (var _local_2:XML in _arg_1.action)
            {
                _SafeStr_4249[String(_local_2.@id)] = new AnimationAction(_local_2);
            };
            return (true);
        }

        public function appendXML(_arg_1:XML):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            for each (var _local_2:XML in _arg_1.action)
            {
                _SafeStr_4249[String(_local_2.@id)] = new AnimationAction(_local_2);
            };
            return (true);
        }

        public function getAction(_arg_1:IActionDefinition):AnimationAction
        {
            return (_SafeStr_4249[_arg_1.id]);
        }

        public function getFrameCount(_arg_1:IActionDefinition):int
        {
            var _local_2:AnimationAction = getAction(_arg_1);
            if (!_local_2)
            {
                return (0);
            };
            return (_local_2.frameCount);
        }


    }
}//package com.sulake.habbo.avatar.structure

// _SafeStr_4249 = "_-Mb" (String#2437, DoABC#4)


