// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G.SnowWarGameTokenOffer

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameTokenOffer 
    {

        private var _offerId:int;
        private var _SafeStr_4263:String;
        private var _SafeStr_4262:int;
        private var _SafeStr_4260:int;
        private var _SafeStr_4261:int;
        private var _SafeStr_3827:int;
        private var _SafeStr_4716:Boolean;

        public function SnowWarGameTokenOffer(_arg_1:IMessageDataWrapper)
        {
            _offerId = _arg_1.readInteger();
            _SafeStr_4263 = _arg_1.readString();
            _SafeStr_4262 = _arg_1.readInteger();
            _SafeStr_4260 = _arg_1.readInteger();
            _SafeStr_4261 = _arg_1.readInteger();
            _SafeStr_4716 = false;
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get localizationId():String
        {
            return (_SafeStr_4263);
        }

        public function get priceInCredits():int
        {
            return (_SafeStr_4262);
        }

        public function get priceInActivityPoints():int
        {
            return (_SafeStr_4260);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }

        public function get giftable():Boolean
        {
            return (_SafeStr_4716);
        }


    }
}//package _-g1G

// _SafeStr_3827 = "_-81k" (String#7107, DoABC#3)
// _SafeStr_4260 = "_-V1Z" (String#8622, DoABC#3)
// _SafeStr_4261 = "_-m1a" (String#9806, DoABC#3)
// _SafeStr_4262 = "_-qJ" (String#10076, DoABC#3)
// _SafeStr_4263 = "_-u1X" (String#10318, DoABC#3)
// _SafeStr_4716 = "_-i" (String#9513, DoABC#3)


