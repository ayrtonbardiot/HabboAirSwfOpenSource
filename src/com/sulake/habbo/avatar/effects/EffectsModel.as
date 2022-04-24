// by nota

//com.sulake.habbo.avatar.effects.EffectsModel

package com.sulake.habbo.avatar.effects
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.inventory._SafeStr_3123;
    import com.sulake.habbo.avatar._SafeStr_3339;

    public class EffectsModel extends CategoryBaseModel implements _SafeStr_3301 
    {

        public static const GRIDTYPE_EFFECTS:String = "effects";

        private var _SafeStr_6006:Dictionary = new Dictionary();
        private var _SafeStr_6205:EffectsParamView;

        public function EffectsModel(_arg_1:HabboAvatarEditor)
        {
            super(_arg_1);
        }

        override protected function init():void
        {
            super.init();
            _SafeStr_3883 = true;
            if (!_SafeStr_3882)
            {
                _SafeStr_3882 = new EffectsView(this);
                _SafeStr_6205 = new EffectsParamView(this, controller.manager.windowManager, controller.manager.assets);
                if (_SafeStr_3882)
                {
                    _SafeStr_3882.init();
                };
            };
        }

        public function get effects():Array
        {
            if (controller.manager.inventory == null)
            {
                return ([]);
            };
            return (controller.manager.inventory.getAvatarEffects());
        }

        override public function selectPart(_arg_1:String, _arg_2:int):void
        {
            var _local_3:* = null;
            setSelectionVisual(_arg_1, _SafeStr_6006[_arg_1], false);
            var _local_5:int = controller.figureData.avatarEffectType;
            if (((_arg_2 == -1) && (!(_local_5 == -1))))
            {
                _arg_2 = EffectsView(_SafeStr_3882).getGridIndex(_local_5);
                for each (var _local_4:_SafeStr_3123 in effects)
                {
                    if (_local_4.type == _local_5)
                    {
                        _local_3 = _SafeStr_3339(_local_4);
                        _local_3.isSelected = true;
                        break;
                    };
                };
            }
            else
            {
                if ((((_arg_2 == -1) && (_local_5 == -1)) || (_arg_2 == 0)))
                {
                    _arg_2 = 0;
                    controller.setAvatarEffectType(-1);
                    _SafeStr_6205.updateView(null);
                }
                else
                {
                    _local_3 = _SafeStr_3339(effects[(_arg_2 - 1)]);
                    _local_3.isSelected = true;
                    controller.setAvatarEffectType(_local_3.type);
                };
            };
            _SafeStr_6006[_arg_1] = _arg_2;
            setSelectionVisual(_arg_1, _arg_2, true);
            _SafeStr_6205.updateView(_local_3);
        }

        private function setSelectionVisual(_arg_1:String, _arg_2:int, _arg_3:Boolean):void
        {
            EffectsView(_SafeStr_3882).updateSelectionVisual(_arg_1, _arg_2, _arg_3);
        }


    }
}//package com.sulake.habbo.avatar.effects

// _SafeStr_3123 = "_-k1o" (String#7780, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3339 = "_-y1N" (String#5817, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_6006 = "_-qO" (String#2810, DoABC#4)
// _SafeStr_6205 = "_-L1q" (String#15099, DoABC#4)


