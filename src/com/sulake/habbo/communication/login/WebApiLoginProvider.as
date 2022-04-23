// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.login.WebApiLoginProvider

package com.sulake.habbo.communication.login
{
    import flash.events.EventDispatcher;
    import com.sulake.habbo.communication._SafeStr_33;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.communication.IHabboWebApiSession;
    import com.sulake.habbo.utils.CommunicationUtils;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;

    public class WebApiLoginProvider extends EventDispatcher implements _SafeStr_33, ILoginProvider, _SafeStr_32 
    {

        public static const ERROR_TYPE_IO_ERROR:String = "ioError";
        public static const ERROR_CODE_MAINTENANCE:String = "maintenance";
        private static const AUTO_RECONNECT:Boolean = false;
        private static const POCKET_MODE_LOGIN_AND_REGISTER:int = 1;
        private static const _SafeStr_8390:int = 2;

        private var _communication:_SafeStr_25;
        private var _SafeStr_8391:String;
        private var _SafeStr_3947:ILoginViewer;
        private var _pendingLoginError:Object;
        private var _autoLogin:Boolean = false;
        private var _localizationLoaded:Boolean;
        private var _SafeStr_8365:Boolean;
        private var _SafeStr_8366:Boolean;
        private var _SafeStr_8392:int = 1;
        private var _name:String;
        private var _SafeStr_3951:String;
        private var _SafeStr_8393:int;
        private var _SafeStr_8394:String;
        private var _ssoToken:String;
        private var _session:IHabboWebApiSession;
        private var _SafeStr_8395:_SafeStr_34;

        public function WebApiLoginProvider(_arg_1:ILoginViewer)
        {
            _SafeStr_3947 = _arg_1;
        }

        public function get disposed():Boolean
        {
            return (false);
        }

        public function init(_arg_1:_SafeStr_25):void
        {
            _communication = _arg_1;
            var _local_2:String = getProperty("web.api");
            _SafeStr_14.log(("[WebApiLoginProvider] Init with: " + _local_2));
            if (_local_2 != null)
            {
                _communication.createHabboWebApiSession(this, _local_2);
            };
            _session = createHabboWebApiSession();
            initHabboWebApiSession();
        }

        public function loginWithCredentials(_arg_1:String, _arg_2:String, _arg_3:int=0):void
        {
            _name = _arg_1;
            _SafeStr_3951 = _arg_2;
            _SafeStr_8393 = _arg_3;
            if (_session)
            {
                _session.login(_arg_1, _arg_2);
            }
            else
            {
                _SafeStr_14.log("[WebApiLoginProvider] Login not available");
            };
        }

        public function loginWithCredentialsWeb(_arg_1:String):void
        {
            _SafeStr_8394 = _arg_1;
            if (_session)
            {
                _session.selectAvatar(_arg_1);
            }
            else
            {
                _SafeStr_14.log("[WebApiLoginProvider] Login not available");
            };
        }

        private function createHabboWebApiSession():IHabboWebApiSession
        {
            var _local_2:IHabboWebApiSession = _communication.getHabboWebApiSession();
            if (_local_2 != null)
            {
                _local_2.dispose();
                _local_2 = null;
            };
            var _local_1:String = getProperty("web.api");
            if (_local_1 == "")
            {
                _local_1 = getProperty("url.prefix");
                _local_1 = _local_1.replace("http:", "https:");
            };
            return (_communication.createHabboWebApiSession(this, _local_1));
        }

        private function initHabboWebApiSession():void
        {
            if (_session)
            {
                _session.hello();
            }
            else
            {
                throw (new Error("Tried to init null IHabboWebApiSession"));
            };
        }

        public function habboWebApiError(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:Object, _arg_5:Boolean=false):void
        {
            var _local_8:Boolean;
            _SafeStr_14.log(((((("[WebApiLoginProvider] Api Error: id: " + _arg_1) + " type: ") + _arg_3) + " captcha: ") + _arg_5));
            var _local_7:String = (((_arg_4) && (_arg_4.error)) ? _arg_4.error : "");
            if (_local_7 == "maintenance")
            {
            };
            var _local_9:Boolean;
            if (_arg_3 == "ioError")
            {
                _local_9 = true;
            };
            var _local_6:IHabboWebApiSession = _communication.getHabboWebApiSession();
            switch (_arg_1)
            {
                case "/api/ssotoken":
                    if (_autoLogin)
                    {
                        _local_9 = true;
                        _local_6.login(_name, _SafeStr_3951);
                    };
                case "/api/public/info/hello":
                    _SafeStr_3947.showLoginScreen();
                    break;
                case "/api/public/registration/new":
                    _SafeStr_3947.showRegistrationError(_arg_4);
                    break;
                case "/api/ssotoken":
                    _SafeStr_14.log("[WebApiLoginProvider] There was an error getting the SSO-token (is this an employee account?)...");
                    _SafeStr_3947.showInvalidLoginError(_arg_4);
                    break;
                case "/api/user/avatars":
                    _SafeStr_14.log("[WebApiLoginProvider] There was an error getting the Avatars");
                    _SafeStr_3947.showInvalidLoginError(_arg_4);
                    break;
                case "/api/newuser/name/check":
                case "/api/newuser/name/select":
                    _SafeStr_14.log("[WebApiLoginProvider] There was an error checking name");
                    _SafeStr_3947.nameCheckResponse(_arg_4, (_arg_1 == "/api/newuser/name/check"));
                    break;
                case "/api/public/authentication/login":
                case "/api/public/authentication/facebook":
                case "/api/force/tos-accept":
                    _SafeStr_14.log("[WebApiLoginProvider] There was an error authorizing connection...");
                    if (((!(_arg_4 == null)) && (((!(_arg_4.message == null)) || (!(_arg_4.error == null))) || (!(_arg_4.errors == null)))))
                    {
                        if (_arg_5)
                        {
                            _local_8 = ((_arg_4.captcha == true) && (_arg_4.message == "invalid-captcha"));
                            if (!_local_8)
                            {
                                _pendingLoginError = _arg_4;
                            };
                            showCaptchaView();
                        }
                        else
                        {
                            _SafeStr_3947.showInvalidLoginError(_arg_4);
                        };
                    }
                    else
                    {
                        if (_arg_5)
                        {
                            showCaptchaView();
                        }
                        else
                        {
                            _SafeStr_3947.showInvalidLoginError(null);
                        };
                    };
                    break;
                case "/api/user/avatars/select":
                    _SafeStr_14.log("[WebApiLoginProvider] There was an error selecting avatar");
                    if (_local_6)
                    {
                        _SafeStr_3947.showAccountError(_arg_4);
                        _SafeStr_3947.showLoadingScreen();
                        _local_6.avatars();
                    }
                    else
                    {
                        _SafeStr_3947.showInvalidLoginError(_arg_4);
                    };
                    break;
                case "/api/newuser/room/select":
                    _SafeStr_14.log("[WebApiLoginProvider] There was an error selecting home room.");
                    break;
                case "/api/user/look/save":
                    _SafeStr_3947.saveLooksError(_arg_4);
                    break;
                default:
                    _SafeStr_14.log(("[WebApiLoginProvider] Did not process Habbo API message: " + _arg_1));
            };
            if (!_local_9)
            {
                _autoLogin = false;
            };
        }

        public function onUserList(_arg_1:Vector.<AvatarData>):void
        {
            var _local_2:* = null;
            if (_autoLogin)
            {
                _local_2 = CommunicationUtils.readSOLString("useruniqueid");
                if (!userExists(_arg_1, _local_2))
                {
                    _SafeStr_3947.populateCharacterList(_arg_1);
                };
            }
            else
            {
                _SafeStr_3947.populateCharacterList(_arg_1);
            };
        }

        public function habboWebApiResponse(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:* = null;
            var _local_8:* = null;
            var _local_7:*;
            var _local_4:int;
            _SafeStr_14.log(("[WebApiLoginProvider] Got Habbo Web Api Response: " + _arg_1), _arg_2);
            var _local_6:IHabboWebApiSession = _communication.getHabboWebApiSession();
            if (_local_6 == null)
            {
                return;
            };
            if ((((!(_arg_2 == null)) && (!(_arg_2.force == null))) && (_arg_2.force is Array)))
            {
                _local_8 = (_arg_2.force as Array);
                if (_local_8.indexOf("TOS") > -1)
                {
                    _SafeStr_3947.showTOS();
                    return;
                };
                if (((_local_8.indexOf("EMAIL") > -1) || (_local_8.indexOf("PASSWORD") > -1)))
                {
                    _SafeStr_3947.showInvalidLoginError({"errors":["account_issue"]});
                    return;
                };
            };
            switch (_arg_1)
            {
                case "/api/public/info/hello":
                    if (_SafeStr_8392 == 1)
                    {
                    };
                    if (_autoLogin)
                    {
                        _local_6.ssoToken();
                    }
                    else
                    {
                        _SafeStr_3947.environmentReady();
                    };
                    return;
                case "/api/user/avatars/select":
                    if (_SafeStr_8392 != 2)
                    {
                        _local_6.ssoToken();
                    };
                    return;
                case "/api/public/authentication/login":
                case "/api/public/authentication/facebook":
                case "/api/force/tos-accept":
                    _local_5 = ((_arg_1 == "/api/public/authentication/login") ? "habbo" : "facebook");
                    CommunicationUtils.writeSOLProperty("loginmethod", _local_5);
                    fetchAvatars();
                    return;
                case "/api/user/avatars":
                    if (_SafeStr_8392 != 2)
                    {
                        _local_7 = new Vector.<AvatarData>(0);
                        for each (var _local_3:Object in _arg_2)
                        {
                            _local_7.push(new AvatarData(_local_3));
                        };
                        if (_local_7.length == 1)
                        {
                            CommunicationUtils.writeSOLProperty("useruniqueid", _local_7[0].uniqueId);
                            _local_6.selectAvatar(_local_7[0].uniqueId);
                        }
                        else
                        {
                            if (!_autoLogin)
                            {
                                _SafeStr_3947.populateCharacterList(_local_7);
                            };
                        };
                    };
                    return;
                case "/api/ssotoken":
                    _ssoToken = _arg_2["ssoToken"];
                    _SafeStr_8392 = 2;
                    dispatchEvent(new SsoTokenAvailableEvent("SSO_TOKEN_AVAILABLE", _ssoToken));
                    return;
                case "/api/public/registration/new":
                    if (_arg_2 != null)
                    {
                        _local_4 = parseInt(_arg_2.id);
                        CommunicationUtils.writeSOLProperty("userid", _local_4.toString());
                    };
                    _SafeStr_3947.showSelectAvatar(_arg_2);
                    return;
                case "/api/public/lists/hotlooks":
                    _SafeStr_3947.showPromoHabbos((_arg_2 as XML));
                    return;
                case "/api/newuser/name/select":
                case "/api/newuser/name/check":
                    _SafeStr_3947.nameCheckResponse(_arg_2, (_arg_1 == "/api/newuser/name/check"));
                    return;
                case "/api/user/look/save":
                    _SafeStr_3947.showSelectRoom();
                    return;
                case "/api/newuser/room/select":
                    CommunicationUtils.writeSOLProperty("loginmethod", "habbo");
                    fetchAvatars();
                    return;
            };
        }

        public function habboWebApiRawResponse(_arg_1:String, _arg_2:Object):void
        {
        }

        public function closeCaptcha():void
        {
            removeCaptchaView();
        }

        private function showCaptchaView():void
        {
            _SafeStr_8395 = _SafeStr_3947.createCaptchaView();
            if (_SafeStr_8395 == null)
            {
                _SafeStr_3947.showCaptchaError();
            };
        }

        public function handleCaptchaError():void
        {
            removeCaptchaView();
            _SafeStr_3947.showCaptchaError();
        }

        public function handleCaptchaResult(_arg_1:String):void
        {
            removeCaptchaView();
            _SafeStr_3947.captchaReady();
            if (_pendingLoginError)
            {
                _SafeStr_3947.showInvalidLoginError(_pendingLoginError);
                _pendingLoginError = null;
            };
            if (((_arg_1 == null) || (_session == null)))
            {
                _SafeStr_3947.showCaptchaError();
                return;
            };
            var _local_2:Boolean = _session.setCaptchaToken(_arg_1);
        }

        private function removeCaptchaView():void
        {
            if (_SafeStr_8395 != null)
            {
                _SafeStr_8395.dispose();
                _SafeStr_8395 = null;
            };
        }

        public function getProperty(_arg_1:String, _arg_2:Dictionary=null):String
        {
            return (_SafeStr_3947.getProperty(_arg_1, _arg_2));
        }

        private function userExists(_arg_1:Vector.<AvatarData>, _arg_2:String):Boolean
        {
            for each (var _local_3:AvatarData in _arg_1)
            {
                if (_local_3.uniqueId == _arg_2)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function fetchAvatars():void
        {
            var _local_1:* = null;
            if (_session == null)
            {
                return;
            };
            if (_autoLogin)
            {
                _local_1 = CommunicationUtils.readSOLString("useruniqueid");
                if (_local_1)
                {
                    _session.selectAvatar(_local_1);
                }
                else
                {
                    _session.avatars();
                };
            }
            else
            {
                if (_SafeStr_8392 == 1)
                {
                    _session.avatars();
                };
            };
        }

        public function selectAvatar(_arg_1:int):void
        {
        }

        public function selectAvatarUniqueid(_arg_1:String):void
        {
            if (_session == null)
            {
                return;
            };
            _session.selectAvatar(_arg_1);
        }


    }
}//package com.sulake.habbo.communication.login

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_25 = "_-G19" (String#7587, DoABC#3)
// _SafeStr_32 = "_-vo" (String#10425, DoABC#3)
// _SafeStr_33 = "_-dW" (String#9241, DoABC#3)
// _SafeStr_34 = "_-41Q" (String#6823, DoABC#3)
// _SafeStr_3947 = "_-n1V" (String#9878, DoABC#3)
// _SafeStr_3951 = "_-d1A" (String#9173, DoABC#3)
// _SafeStr_8365 = "_-S1K" (String#8404, DoABC#3)
// _SafeStr_8366 = "_-s1n" (String#10199, DoABC#3)
// _SafeStr_8390 = "_-eY" (String#9311, DoABC#3)
// _SafeStr_8391 = "_-11D" (String#6537, DoABC#3)
// _SafeStr_8392 = "_-NM" (String#8097, DoABC#3)
// _SafeStr_8393 = "_-o14" (String#9923, DoABC#3)
// _SafeStr_8394 = "_-Z1s" (String#8915, DoABC#3)
// _SafeStr_8395 = "_-Wm" (String#8753, DoABC#3)


