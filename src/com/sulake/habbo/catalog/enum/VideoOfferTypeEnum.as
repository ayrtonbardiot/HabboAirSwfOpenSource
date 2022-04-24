// by nota

//com.sulake.habbo.catalog.enum.VideoOfferTypeEnum

package com.sulake.habbo.catalog.enum
{
    public class VideoOfferTypeEnum 
    {

        public static const CREDIT:VideoOfferTypeEnum = new VideoOfferTypeEnum(0);
        public static const SNOWWAR:VideoOfferTypeEnum = new VideoOfferTypeEnum(1);

        private var _SafeStr_4525:int = 0;

        public function VideoOfferTypeEnum(_arg_1:int):void
        {
            _SafeStr_4525 = _arg_1;
        }

        public function get value():int
        {
            return (_SafeStr_4525);
        }

        public function equals(_arg_1:VideoOfferTypeEnum):Boolean
        {
            return ((_arg_1) && (_arg_1._SafeStr_4525 == _SafeStr_4525));
        }


    }
}//package com.sulake.habbo.catalog.enum

// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)


