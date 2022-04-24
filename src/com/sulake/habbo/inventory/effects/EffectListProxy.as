// by nota

//com.sulake.habbo.inventory.effects.EffectListProxy

package com.sulake.habbo.inventory.effects
{
    import com.sulake.habbo.inventory.common.IThumbListDataProvider;

    public class EffectListProxy implements IThumbListDataProvider 
    {

        private var _SafeStr_4619:EffectsModel;
        private var _SafeStr_5447:int;

        public function EffectListProxy(_arg_1:EffectsModel, _arg_2:int)
        {
            _SafeStr_4619 = _arg_1;
            _SafeStr_5447 = _arg_2;
        }

        public function dispose():void
        {
            _SafeStr_4619 = null;
        }

        public function getDrawableList():Array
        {
            return (_SafeStr_4619.getEffects(_SafeStr_5447));
        }


    }
}//package com.sulake.habbo.inventory.effects

// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_5447 = "_-62" (String#1087, DoABC#4)


