// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//onBoardingHcUi.LocalizedSprite

package onBoardingHcUi
{
    import flash.display.Sprite;
    import com.sulake.core.localization.ILocalizable;
    import com.sulake.core.localization._SafeStr_17;

    public class LocalizedSprite extends Sprite implements ILocalizable 
    {

        private static var _localizationManager:_SafeStr_17;

        protected var _localized:Boolean = false;


        public static function set localizationManager(_arg_1:_SafeStr_17):void
        {
            _localizationManager = _arg_1;
        }

        public static function get localizationManager():_SafeStr_17
        {
            return (_localizationManager);
        }


        public function dispose():void
        {
            var _local_1:String = "";
            if ((this is Button))
            {
                _local_1 = (this as Button).label;
            };
            removeOldLocalization(_local_1);
        }

        public function set localization(_arg_1:String):void
        {
            if ((this is Button))
            {
                (this as Button).localizedText = _arg_1;
            };
        }

        protected function removeOldLocalization(_arg_1:String):void
        {
            if (_localized)
            {
                localizationManager.removeListener(_arg_1.slice(2, _arg_1.indexOf("}")), this);
                _localized = false;
            };
        }

        protected function checkLocalization(_arg_1:String):void
        {
            if (((((localizationManager) && (_arg_1)) && (_arg_1.charAt(0) == "$")) && (_arg_1.charAt(1) == "{")))
            {
                _localized = true;
                localizationManager.registerListener(_arg_1.slice(2, _arg_1.indexOf("}")), this);
            };
        }


    }
}//package onBoardingHcUi

// _SafeStr_17 = "_-94" (String#7182, DoABC#3)


