// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-JS._SafeStr_1600

package _-JS
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1600 
    {

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_3834:int;
        private var _online:Boolean;
        private var _SafeStr_4879:Boolean;
        private var _SafeStr_3819:String;
        private var _SafeStr_4674:int;
        private var _SafeStr_4880:String;
        private var _SafeStr_4881:String;
        private var _realName:String;
        private var _SafeStr_7333:String;
        private var _SafeStr_4882:Boolean;
        private var _SafeStr_4884:Boolean;
        private var _SafeStr_4883:Boolean;
        private var _relationshipStatus:int;

        public function _SafeStr_1600(_arg_1:IMessageDataWrapper)
        {
            this._SafeStr_3820 = _arg_1.readInteger();
            this._name = _arg_1.readString();
            this._SafeStr_3834 = _arg_1.readInteger();
            this._online = _arg_1.readBoolean();
            this._SafeStr_4879 = _arg_1.readBoolean();
            this._SafeStr_3819 = _arg_1.readString();
            this._SafeStr_4674 = _arg_1.readInteger();
            this._SafeStr_4880 = _arg_1.readString();
            this._realName = _arg_1.readString();
            this._SafeStr_7333 = _arg_1.readString();
            this._SafeStr_4882 = _arg_1.readBoolean();
            this._SafeStr_4884 = _arg_1.readBoolean();
            this._SafeStr_4883 = _arg_1.readBoolean();
            this._relationshipStatus = _arg_1.readShort();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get gender():int
        {
            return (_SafeStr_3834);
        }

        public function get online():Boolean
        {
            return (_online);
        }

        public function get followingAllowed():Boolean
        {
            return (_SafeStr_4879);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }

        public function get lastAccess():String
        {
            return (_SafeStr_4881);
        }

        public function get realName():String
        {
            return (_realName);
        }

        public function get facebookId():String
        {
            return (_SafeStr_7333);
        }

        public function get persistedMessageUser():Boolean
        {
            return (_SafeStr_4882);
        }

        public function get vipMember():Boolean
        {
            return (_SafeStr_4884);
        }

        public function get pocketHabboUser():Boolean
        {
            return (_SafeStr_4883);
        }

        public function get relationshipStatus():int
        {
            return (_relationshipStatus);
        }


    }
}//package _-JS

// _SafeStr_1600 = "_-Cu" (String#7407, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)
// _SafeStr_4879 = "_-W1k" (String#8721, DoABC#3)
// _SafeStr_4880 = "_-v1" (String#10374, DoABC#3)
// _SafeStr_4881 = "_-u1c" (String#10321, DoABC#3)
// _SafeStr_4882 = "_-H18" (String#7660, DoABC#3)
// _SafeStr_4883 = "_-M1n" (String#8015, DoABC#3)
// _SafeStr_4884 = "_-TR" (String#8517, DoABC#3)
// _SafeStr_7333 = "_-A1Y" (String#7225, DoABC#3)


