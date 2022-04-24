// by nota

//onBoardingHcUi.LocalizedTextField

package onBoardingHcUi
{
    import flash.text.TextField;
    import com.sulake.core.localization.ILocalizable;
    import com.sulake.core.localization._SafeStr_17;

    public class LocalizedTextField extends TextField implements ILocalizable 
    {

        private static var _localizationManager:_SafeStr_17;

        protected var _localized:Boolean = false;
        private var _key:String;


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
            removeOldLocalization(_key);
        }

        override public function set htmlText(_arg_1:String):void
        {
            super.htmlText = _arg_1;
            checkLocalization(_arg_1);
            if (_localized)
            {
            };
        }

        public function set localization(_arg_1:String):void
        {
            super.htmlText = _arg_1;
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
                removeOldLocalization(_key);
                _key = _arg_1;
                _localized = true;
                localizationManager.registerListener(_arg_1.slice(2, _arg_1.indexOf("}")), this);
            };
        }


    }
}//package onBoardingHcUi

// _SafeStr_17 = "_-94" (String#7182, DoABC#3)


