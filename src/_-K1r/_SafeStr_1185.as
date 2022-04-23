// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1r._SafeStr_1185

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1185 implements IMessageParser 
    {

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_6381:String;
        private var _SafeStr_7345:String;
        private var _realName:String;
        private var _SafeStr_7346:Boolean;
        private var _SafeStr_7347:int;
        private var _SafeStr_3832:int;
        private var _SafeStr_3824:int;
        private var _SafeStr_7348:Boolean;
        private var _SafeStr_7349:String;
        private var _SafeStr_3836:Boolean;
        private var _SafeStr_3831:Boolean = false;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_3820 = _arg_1.readInteger();
            this._name = _arg_1.readString();
            this._SafeStr_3819 = _arg_1.readString();
            this._SafeStr_6381 = _arg_1.readString();
            this._SafeStr_7345 = _arg_1.readString();
            this._realName = _arg_1.readString();
            this._SafeStr_7346 = _arg_1.readBoolean();
            this._SafeStr_7347 = _arg_1.readInteger();
            this._SafeStr_3832 = _arg_1.readInteger();
            this._SafeStr_3824 = _arg_1.readInteger();
            this._SafeStr_7348 = _arg_1.readBoolean();
            this._SafeStr_7349 = _arg_1.readString();
            this._SafeStr_3836 = _arg_1.readBoolean();
            this._SafeStr_3831 = _arg_1.readBoolean();
            return (true);
        }

        public function get id():int
        {
            return (this._SafeStr_3820);
        }

        public function get name():String
        {
            return (this._name);
        }

        public function get figure():String
        {
            return (this._SafeStr_3819);
        }

        public function get sex():String
        {
            return (this._SafeStr_6381);
        }

        public function get customData():String
        {
            return (this._SafeStr_7345);
        }

        public function get realName():String
        {
            return (this._realName);
        }

        public function get directMail():Boolean
        {
            return (this._SafeStr_7346);
        }

        public function get respectTotal():int
        {
            return (this._SafeStr_7347);
        }

        public function get respectLeft():int
        {
            return (this._SafeStr_3832);
        }

        public function get petRespectLeft():int
        {
            return (this._SafeStr_3824);
        }

        public function get streamPublishingAllowed():Boolean
        {
            return (this._SafeStr_7348);
        }

        public function get lastAccessDate():String
        {
            return (this._SafeStr_7349);
        }

        public function get nameChangeAllowed():Boolean
        {
            return (this._SafeStr_3836);
        }

        public function get accountSafetyLocked():Boolean
        {
            return (_SafeStr_3831);
        }


    }
}//package _-K1r

// _SafeStr_1185 = "_-Fb" (String#7571, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_3824 = "_-p1O" (String#9984, DoABC#3)
// _SafeStr_3831 = "_-Ji" (String#7851, DoABC#3)
// _SafeStr_3832 = "_-11B" (String#6536, DoABC#3)
// _SafeStr_3836 = "_-bB" (String#9076, DoABC#3)
// _SafeStr_6381 = "_-51T" (String#6885, DoABC#3)
// _SafeStr_7345 = "_-fU" (String#9367, DoABC#3)
// _SafeStr_7346 = "_-S1B" (String#8400, DoABC#3)
// _SafeStr_7347 = "_-z1" (String#10652, DoABC#3)
// _SafeStr_7348 = "_-TM" (String#8514, DoABC#3)
// _SafeStr_7349 = "_-1m" (String#6617, DoABC#3)


