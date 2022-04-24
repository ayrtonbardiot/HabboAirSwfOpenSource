// by nota

//com.sulake.habbo.phonenumber.HabboPhoneNumber

package com.sulake.habbo.phonenumber
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import __AS3__.vec.Vector;
    import _-Sv._SafeStr_738;
    import _-Sv._SafeStr_721;
    import _-Sv._SafeStr_460;
    import _-T7._SafeStr_808;
    import _-T7._SafeStr_455;
    import _-T7._SafeStr_435;
    import _-T7._SafeStr_666;
    import flash.utils.getTimer;

    public class HabboPhoneNumber extends _SafeStr_20 
    {

        protected var _communicationManager:IHabboCommunicationManager;
        protected var _localizationManager:_SafeStr_18;
        protected var _sessionDataManager:ISessionDataManager;
        protected var _toolbar:IHabboToolbar;
        protected var _windowManager:_SafeStr_1695;
        private var _connection:IConnection;
        private var _SafeStr_4646:PhoneNumberCollectView;
        private var _SafeStr_4645:PhoneNumberCollectMinimizedView;
        private var _SafeStr_4648:VerificationCodeInputView;
        private var _SafeStr_4647:VerificationCodeInputMinimizedView;
        private var _retryEnableTime:int;

        public function HabboPhoneNumber(_arg_1:_SafeStr_31, _arg_2:uint, _arg_3:_SafeStr_21)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communicationManager = _arg_1;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            if (getBoolean("sms.identity.verification.enabled"))
            {
                _connection = _communicationManager.connection;
                _connection.addMessageEvent(new _SafeStr_738(onStateMessage));
                _connection.addMessageEvent(new _SafeStr_721(onPhoneNumberResultMessage));
                _connection.addMessageEvent(new _SafeStr_460(onVerificationCodeResultMessage));
            };
        }

        public function sendTryPhoneNumber(_arg_1:String, _arg_2:String):void
        {
            _connection.send(new _SafeStr_808(_arg_1, _arg_2));
        }

        public function sendTryVerificationCode(_arg_1:String):void
        {
            if (!_arg_1)
            {
                return;
            };
            _arg_1 = _arg_1.toUpperCase();
            _connection.send(new _SafeStr_455(_arg_1));
        }

        public function setNeverAgain():void
        {
            _connection.send(new _SafeStr_435(2));
            destroyCollectView();
        }

        public function setCollectViewMinimized(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                destroyCollectView();
                createCollectMinimizedView();
            }
            else
            {
                destroyCollectMinimizedView();
                createCollectView();
            };
        }

        public function setVerifyViewMinimized(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                destroyVerifyView();
                createVerifyMinimizedView();
            }
            else
            {
                destroyVerifyMinimizedView();
                createVerifyView();
            };
        }

        public function requestPhoneNumberCollectionReset():void
        {
            destroyVerifyView();
            _connection.send(new _SafeStr_666());
        }

        private function onPhoneNumberResultMessage(_arg_1:_SafeStr_721):void
        {
            switch (_arg_1.getParser().resultCode)
            {
                case 2:
                    destroyCollectView();
                    return;
                case 1:
                case 3:
                case 9:
                    destroyCollectView();
                    _retryEnableTime = (_arg_1.getParser().millisToAllowProcessReset + getTimer());
                    createVerifyView();
                    return;
                case 4:
                case 5:
                case 6:
                case 10:
                    if (((!(_SafeStr_4645)) && (!(_SafeStr_4646))))
                    {
                        createCollectView();
                    }
                    else
                    {
                        if (_SafeStr_4645)
                        {
                            setCollectViewMinimized(false);
                        };
                    };
                    _windowManager.alert("${generic.alert.title}", (("${phone.number.collect.error." + _arg_1.getParser().resultCode) + "}"), 0, null);
                    _SafeStr_4646.handleSubmitFailure(_arg_1.getParser().resultCode);
                default:
            };
        }

        private function onVerificationCodeResultMessage(_arg_1:_SafeStr_460):void
        {
            switch (_arg_1.getParser().resultCode)
            {
                case 2:
                case 3:
                    destroyVerifyView();
                    return;
                case 4:
                    if (((!(_SafeStr_4647)) && (!(_SafeStr_4648))))
                    {
                        _retryEnableTime = (getTimer() + _arg_1.getParser().millisecondsToAllowProcessReset);
                        createVerifyView();
                    }
                    else
                    {
                        if (_SafeStr_4647)
                        {
                            setVerifyViewMinimized(false);
                        };
                    };
                    _SafeStr_4648.handleSubmitFailure(_arg_1.getParser().resultCode);
                default:
            };
        }

        private function onStateMessage(_arg_1:_SafeStr_738):void
        {
            var _local_2:int = _arg_1.getParser().collectionStatusCode;
            var _local_3:int = _arg_1.getParser().phoneStatusCode;
            context.configuration.setProperty("phone.collection.status", _local_2.toString());
            context.configuration.setProperty("phone.verification.status", _local_3.toString());
            if (_local_2 == 2)
            {
                return;
            };
            if (((_local_2 == 3) && ((_local_3 == 9) || (_local_3 == 1))))
            {
                destroyCollectView();
                if (_local_2 == 1)
                {
                    createVerifyMinimizedView();
                }
                else
                {
                    _retryEnableTime = (_arg_1.getParser().millisecondsToAllowProcessReset + getTimer());
                    createVerifyView();
                };
                return;
            };
            switch (_local_3)
            {
                case 0:
                case 9:
                    createCollectView();
                    return;
                case 2:
                case 3:
                    destroyCollectView();
                    destroyVerifyView();
                    return;
                case 4:
                case 5:
                case 6:
                    _SafeStr_14.log("INVALID STATE!! Phone number / verify errors should not be handled here!");
                default:
            };
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localizationManager():_SafeStr_18
        {
            return (_localizationManager);
        }

        public function get retryEnableTime():int
        {
            return (_retryEnableTime);
        }

        private function createCollectView():void
        {
            destroyCollectView();
            var _local_2:String = context.configuration.getProperty("phone.number.preferred.countries");
            var _local_1:Array = _local_2.split(",");
            _SafeStr_4646 = new PhoneNumberCollectView(this, _local_1);
        }

        private function createVerifyView():void
        {
            destroyVerifyView();
            _SafeStr_4648 = new VerificationCodeInputView(this);
        }

        private function createCollectMinimizedView():void
        {
            destroyCollectMinimizedView();
            _SafeStr_4645 = new PhoneNumberCollectMinimizedView(this);
            _toolbar.extensionView.attachExtension("phone_number", _SafeStr_4645.window, 12);
        }

        private function createVerifyMinimizedView():void
        {
            destroyVerifyMinimizedView();
            _SafeStr_4647 = new VerificationCodeInputMinimizedView(this);
            _toolbar.extensionView.attachExtension("verification_code", _SafeStr_4647.window, 12);
        }

        private function destroyCollectView():void
        {
            if (_SafeStr_4646)
            {
                _SafeStr_4646.dispose();
                _SafeStr_4646 = null;
            };
        }

        private function destroyVerifyView():void
        {
            if (_SafeStr_4648)
            {
                _SafeStr_4648.dispose();
                _SafeStr_4648 = null;
            };
        }

        private function destroyCollectMinimizedView():void
        {
            _toolbar.extensionView.detachExtension("phone_number");
            if (_SafeStr_4645)
            {
                _SafeStr_4645.dispose();
                _SafeStr_4645 = null;
            };
        }

        private function destroyVerifyMinimizedView():void
        {
            _toolbar.extensionView.detachExtension("verification_code");
            if (_SafeStr_4647)
            {
                _SafeStr_4647.dispose();
                _SafeStr_4647 = null;
            };
        }


    }
}//package com.sulake.habbo.phonenumber

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_435 = "_-dd" (String#12040, DoABC#4)
// _SafeStr_455 = "_-WC" (String#29283, DoABC#4)
// _SafeStr_460 = "_-51h" (String#23485, DoABC#4)
// _SafeStr_4645 = "_-E1f" (String#7234, DoABC#4)
// _SafeStr_4646 = "_-u1S" (String#7958, DoABC#4)
// _SafeStr_4647 = "_-Ob" (String#7128, DoABC#4)
// _SafeStr_4648 = "_-K6" (String#8350, DoABC#4)
// _SafeStr_666 = "_-Q1Y" (String#21046, DoABC#4)
// _SafeStr_721 = "_-N1F" (String#25489, DoABC#4)
// _SafeStr_738 = "_-Zb" (String#24770, DoABC#4)
// _SafeStr_808 = "_-Au" (String#30191, DoABC#4)


