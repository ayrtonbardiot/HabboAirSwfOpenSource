// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//login.LoginFlow

package login
{
    import flash.display.Sprite;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.communication.login.ILoginViewer;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.habbo.configuration.HabboConfigurationManager;
    import com.sulake.habbo.communication.HabboCommunicationManager;
    import com.sulake.habbo.localization.HabboLocalizationManager;
    import com.sulake.habbo.communication.login.ILoginProvider;
    import onBoardingHcUi.ColouredButton;
    import flash.display.Loader;
    import flash.utils.Dictionary;
    import onBoardingHcUi.LocalizedSprite;
    import onBoardingHcUi.LocalizedTextField;
    import flash.utils.ByteArray;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.habbo.communication.login.WebApiLoginProvider;
    import flash.events.Event;
    import com.sulake.habbo.communication.login.SsoTokenAvailableEvent;
    import flash.display.Bitmap;
    import flash.geom.Rectangle;
    import com.sulake.habbo.utils.animation.TweenUtils;
    import flash.utils.getTimer;
    import onBoardingHcUi.LoaderUI;
    import flash.filters.GlowFilter;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.text.TextField;
    import com.sulake.habbo.communication.login.AvatarData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.login._SafeStr_34;
    import onBoardingHcUi.Button;
    import com.sulake.habbo.utils.CommunicationUtils;

    public class LoginFlow extends Sprite implements ILoginContext, _SafeStr_13, ILoginViewer 
    {

        public static const LOGIN_FLOW_FINISHED_EVENT:String = "LOGIN_FLOW_FINISHED_EVENT";
        private static const ERROR_TYPE_IO_ERROR:String = "ioError";
        private static const LOGO_AREA_HEIGHT:int = 50;
        private static const MAIN_AREA_MARGIN:int = 5;
        public static const SCREEN_ENVIRONMENT:int = 1;
        public static const SCREEN_LOGIN:int = 2;
        public static const SCREEN_AVATARS:int = 3;
        public static const SCREEN_SSO_TOKEN:int = 4;

        public static var ubuntu_regular:Class = _SafeStr_30;
        public static var ubuntu_bold:Class = _SafeStr_28;
        public static var ubuntu_italic:Class = _SafeStr_29;
        public static var ubuntu_bold_italic:Class = _SafeStr_27;
        private static const habbo_logo_png:Class = logo_new_png$ee7cfff2196c485e358f70e88b19efc31890944547;

        private var _background:Background;
        private var _SafeStr_9224:Sprite;
        private var _SafeStr_9225:EnvironmentView;
        private var _SafeStr_3947:LoginView;
        private var _SafeStr_9226:SsoTokenView;
        private var _SafeStr_9227:AvatarView;
        private var _SafeStr_4036:Boolean;
        private var _SafeStr_9228:_SafeStr_31;
        private var _errorBalloon:Sprite;
        private var _SafeStr_9229:Sprite;
        private var _SafeStr_9230:Sprite;
        private var _configuration:HabboConfigurationManager;
        private var _communication:HabboCommunicationManager;
        private var _localization:HabboLocalizationManager;
        private var _SafeStr_3948:ILoginProvider;
        private var _ssoToken:String;
        private var _closeButton:ColouredButton;
        private var _SafeStr_9231:Loader;
        private var _SafeStr_9232:Loader;
        private var _lastFrameTime:int;

        public function LoginFlow(_arg_1:Dictionary)
        {
            createFakeContext(_arg_1);
        }

        public function get ssoToken():String
        {
            return (_ssoToken);
        }

        public function dispose():void
        {
            removeEventListener("enterFrame", onEnterFrame);
            if (_SafeStr_4036)
            {
                return;
            };
            if (_SafeStr_9228)
            {
                _SafeStr_9228.dispose();
                _SafeStr_9228 = null;
            };
            if (_background)
            {
                removeChild(_background);
                _background.dispose();
                _background = null;
            };
            if (_SafeStr_9229 != null)
            {
                removeChild(_SafeStr_9229);
                _SafeStr_9229 = null;
            };
            hideViews();
            _SafeStr_9225.dispose();
            _SafeStr_3947.dispose();
            _SafeStr_9227.dispose();
            _SafeStr_9226.dispose();
            _SafeStr_3948 = null;
            stage.removeChild(this);
            _SafeStr_4036 = true;
            LocalizedSprite.localizationManager = null;
            LocalizedTextField.localizationManager = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function createConfiguration(_arg_1:_SafeStr_31):HabboConfigurationManager
        {
            var _local_5:XML = new XML("<manifest><library /></manifest>");
            var _local_2:ByteArray = (new HabboConfigurationCom.manifest() as ByteArray);
            var _local_3:XML = new XML(_local_2.readUTFBytes(_local_2.length));
            _local_5.library.appendChild(_local_3.component.assets);
            var _local_4:_SafeStr_21 = new AssetLibrary("_assetsConfiguration@");
            _local_4.loadFromResource(_local_5, HabboConfigurationCom);
            return (new HabboConfigurationManager(_arg_1, 0, _local_4));
        }

        private function createLocalization(_arg_1:_SafeStr_31):HabboLocalizationManager
        {
            var _local_5:XML = new XML("<manifest><library /></manifest>");
            var _local_2:ByteArray = (new HabboLocalizationCom.manifest() as ByteArray);
            var _local_3:XML = new XML(_local_2.readUTFBytes(_local_2.length));
            _local_5.library.appendChild(_local_3.component.assets);
            var _local_4:_SafeStr_21 = new AssetLibrary("_assetsLocalization@");
            _local_4.loadFromResource(_local_5, HabboLocalizationCom);
            return (new HabboLocalizationManager(_arg_1, 0, _local_4));
        }

        private function createCommunication(_arg_1:_SafeStr_31):HabboCommunicationManager
        {
            var _local_3:ByteArray = (new HabboCommunicationCom.manifest() as ByteArray);
            var _local_4:XML = new XML(_local_3.readUTFBytes(_local_3.length));
            var _local_2:XML = new XML("<manifest><library /></manifest>");
            _local_2.library.appendChild(_local_4.component.assets);
            var _local_5:_SafeStr_21 = new AssetLibrary("_assetsTemp@", _local_2);
            _local_5.loadFromResource(_local_2, HabboCommunicationCom);
            return (new HabboCommunicationManager(_arg_1, 0, _local_5));
        }

        private function createFakeContext(_arg_1:Dictionary):void
        {
            _SafeStr_9228 = new FakeContext(_arg_1);
            var _local_3:XML = new XML("<manifest><library /></manifest>");
            var _local_2:_SafeStr_21 = new AssetLibrary("_assetsTemp@", _local_3);
            (_SafeStr_9228.assets as AssetLibraryCollection).addAssetLibrary(_local_2);
            _configuration = createConfiguration(_SafeStr_9228);
            _localization = createLocalization(_SafeStr_9228);
            _communication = createCommunication(_SafeStr_9228);
            LocalizedSprite.localizationManager = _localization;
            LocalizedTextField.localizationManager = _localization;
            _localization.loadDefaultEmbedLocalizations(_configuration.getProperty("environment.id"));
            _SafeStr_3948 = new WebApiLoginProvider(this);
            _SafeStr_3948.addEventListener("SSO_TOKEN_AVAILABLE", onSsoTokenAvailable);
        }

        private function onSsoTokenAvailable(_arg_1:SsoTokenAvailableEvent):void
        {
            _ssoToken = _arg_1.ssoToken;
            dispatchEvent(new Event("LOGIN_FLOW_FINISHED_EVENT"));
        }

        public function initLoginWithSsoToken(_arg_1:String, _arg_2:String):void
        {
            updateEnvironment(_arg_1, false);
            _ssoToken = _arg_2;
            dispatchEvent(new Event("LOGIN_FLOW_FINISHED_EVENT"));
        }

        public function init():void
        {
            stage.addEventListener("resize", onStageResize);
            _background = new Background();
            addChild(_background);
            _SafeStr_9231 = new Loader();
            _SafeStr_9231.visible = false;
            _SafeStr_9231.alpha = 0;
            addChild(_SafeStr_9231);
            _SafeStr_9232 = new Loader();
            _SafeStr_9232.visible = false;
            _SafeStr_9232.alpha = 0;
            addChild(_SafeStr_9232);
            _SafeStr_9230 = new Sprite();
            addChild(_SafeStr_9230);
            var _local_1:Bitmap = new habbo_logo_png();
            _local_1.x = 40;
            _local_1.y = 40;
            _SafeStr_9230.addChild(_local_1);
            _SafeStr_9229 = new Sprite();
            addChild(_SafeStr_9229);
            _SafeStr_9229.y = 50;
            _SafeStr_9229.x = 5;
            _SafeStr_9224 = new Sprite();
            _SafeStr_9224.x = 0;
            _SafeStr_9224.y = 50;
            _SafeStr_9224.visible = true;
            _SafeStr_9229.addChild(_SafeStr_9224);
            _SafeStr_9225 = new EnvironmentView(this);
            _SafeStr_3947 = new LoginView(this);
            _SafeStr_9227 = new AvatarView(this);
            _SafeStr_9226 = new SsoTokenView(this);
            _closeButton = new ColouredButton("red", "X", new Rectangle(0, 0, 0, 40), true, onClose, 0xD8D8D8);
            _SafeStr_9225.init();
            loadImages();
            showScreen(4);
            layoutMainElements();
            addEventListener("addedToStage", onAddedToStage);
            addEventListener("enterFrame", onEnterFrame);
        }

        private function loadImages():void
        {
            ImageLoader.CreateLoader(_SafeStr_9232, getProperty("landing.view.background_right.uri"), onImageComplete);
            ImageLoader.CreateLoader(_SafeStr_9231, getProperty("landing.view.background_left.uri"), onImageComplete);
        }

        private function onImageComplete(_arg_1:ImageLoaderEvent):void
        {
            _SafeStr_14.log(("Image complete: " + _arg_1.url));
            _arg_1.loader.visible = true;
            TweenUtils.alphaTweenVisible(_arg_1.loader, 0, 1.2);
            layoutMainElements();
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            removeEventListener("addedToStage", onAddedToStage);
            _lastFrameTime = getTimer();
            layoutMainElements();
        }

        private function onEnterFrame(_arg_1:Event):void
        {
            TweenUtils._SafeStr_3542.advanceTime(((getTimer() - _lastFrameTime) / 1000));
            _lastFrameTime = getTimer();
        }

        private function onStageResize(_arg_1:Event):void
        {
            if (disposed)
            {
                return;
            };
            layoutMainElements();
        }

        private function layoutMainElements():void
        {
            var _local_2:int;
            if (disposed)
            {
                return;
            };
            if (_SafeStr_4036)
            {
                return;
            };
            if (_background != null)
            {
                _background.resize();
            };
            var _local_1:int = (_SafeStr_9229.width + 20);
            if (stage.stageWidth > _local_1)
            {
                _local_2 = int(((stage.stageWidth - _local_1) / 2));
                if (_local_2 < 5)
                {
                    _local_2 = 5;
                };
                _SafeStr_9229.x = _local_2;
            }
            else
            {
                _SafeStr_9229.x = 5;
            };
            _SafeStr_9229.y = 50;
            _closeButton.y = 30;
            _closeButton.x = ((stage.stageWidth - _closeButton.width) - 30);
            _SafeStr_9232.x = Math.max(400, ((stage.stageWidth - _SafeStr_9232.width) + 50));
            _SafeStr_9232.y = ((stage.stageHeight - _SafeStr_9232.height) + 50);
            _SafeStr_9231.x = -50;
            _SafeStr_9231.y = ((stage.stageHeight - _SafeStr_9231.height) + 50);
        }

        public function showErrorMessage(_arg_1:String):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            if (_errorBalloon == null)
            {
                _local_4 = LoaderUI.createTextField(_arg_1, 12, 0xFFFFFF, true);
                LoaderUI.addEtching(_local_4, true);
                _local_3 = LoaderUI.createBalloon((_local_4.width + 30), (_local_4.height + 17), -1, true, 11411485, "down");
                _errorBalloon = new Sprite();
                _errorBalloon.addChild(_local_3);
                _errorBalloon.addChild(_local_4);
                _local_4.x = 15;
                _local_4.y = 14;
                _SafeStr_9229.addChild(_errorBalloon);
                _errorBalloon.x = 300;
                _errorBalloon.y = 300;
                _errorBalloon.filters = [new GlowFilter(0, 0.24, 6, 6)];
            };
            var _local_2:Timer = new Timer(3000, 1);
            _local_2.addEventListener("timerComplete", onHideError);
            _local_2.start();
            _errorBalloon.visible = true;
        }

        private function onHideError(_arg_1:TimerEvent):void
        {
            if (_errorBalloon)
            {
                _errorBalloon.visible = false;
            };
        }

        public function editorFinished():void
        {
            dispatchEvent(new Event("LOGIN_FLOW_FINISHED_EVENT"));
        }

        public function showScreen(_arg_1:int):void
        {
            hideViews();
            var _local_2:String = "";
            var _local_3:String = "";
            switch (_arg_1)
            {
                case 1:
                    _SafeStr_9224.addChild(_SafeStr_9225);
                    _SafeStr_9225.init();
                    break;
                case 2:
                    _SafeStr_9224.addChild(_SafeStr_3947);
                    _SafeStr_3947.init();
                    _SafeStr_3948.init(_communication);
                    break;
                case 4:
                    _SafeStr_9224.addChild(_SafeStr_9226);
                    _SafeStr_9226.init();
                    break;
                case 3:
                    _SafeStr_9224.addChild(_SafeStr_9227);
                    _SafeStr_9227.init();
                    _SafeStr_9227.baseUrl = getProperty("web.api");
                    layoutMainElements();
                default:
            };
            layoutMainElements();
        }

        public function get debugText():TextField
        {
            return (null);
        }

        private function hideViews():void
        {
            while (_SafeStr_9224.numChildren > 0)
            {
                _SafeStr_9224.removeChildAt(0);
            };
        }

        public function initLogin(_arg_1:String, _arg_2:String):void
        {
            _SafeStr_3948.loginWithCredentials(_arg_1, _arg_2);
        }

        public function loginWithAvatar(_arg_1:AvatarData):void
        {
            _SafeStr_3948.loginWithCredentialsWeb(_arg_1.uniqueId);
        }

        public function showLoginScreen():void
        {
        }

        public function showRegistrationError(_arg_1:Object):void
        {
            showError(_arg_1);
        }

        public function showInvalidLoginError(_arg_1:Object):void
        {
            showError(_arg_1);
        }

        public function nameCheckResponse(_arg_1:Object, _arg_2:Boolean):void
        {
        }

        public function showAccountError(_arg_1:Object):void
        {
            showError(_arg_1);
        }

        public function showLoadingScreen():void
        {
        }

        public function saveLooksError(_arg_1:Object):void
        {
            showError(_arg_1);
        }

        public function showTOS():void
        {
            showErrorMessage("Need to show TOS");
        }

        public function environmentReady():void
        {
            _SafeStr_3947.ready();
        }

        public function populateCharacterList(_arg_1:Vector.<AvatarData>):void
        {
            showScreen(3);
            _SafeStr_9227.populateAvatars(_arg_1);
        }

        public function showSelectAvatar(_arg_1:Object):void
        {
        }

        public function showPromoHabbos(_arg_1:XML):void
        {
        }

        public function showSelectRoom():void
        {
        }

        public function showCaptchaError():void
        {
            showScreen(2);
            showErrorMessage("Error with captcha");
        }

        private function showError(_arg_1:Object):void
        {
            var _local_3:* = null;
            var _local_4:Array = _arg_1.errors;
            var _local_2:String = (((_local_4) && (_local_4.length > 0)) ? _local_4[0] : "");
            if (((_local_2 == "") && (!(_arg_1 == null))))
            {
                if (_arg_1.error != null)
                {
                    _local_2 = _arg_1.error;
                }
                else
                {
                    if (_arg_1.message != null)
                    {
                        _local_2 = _arg_1.message;
                    };
                };
            };
            switch (_local_2)
            {
                case "invalid-captcha":
                    showCaptchaError();
                    break;
                case "login.user_banned":
                    _local_3 = "connection.login.error.banned.desc";
                    break;
                case "login.blocked":
                    _local_3 = "connection.login.error.blocked.desc";
                    break;
                case "unauthorized-staff-login":
                    _local_3 = "connection.login.error.unauthorized.staff";
                    break;
                case "pocket.auth.login_failed":
                    _local_3 = "connection.login.error.-3.desc";
                    break;
                case "pocket.auth.no_avatars":
                    _local_3 = "connection.login.missing_avatars";
                    break;
                case "pocket.auth.valid_email_required":
                    _local_3 = "connection.login.missing_credentials";
                    break;
                case "pocket.auth.password_required":
                    _local_3 = "connection.login.missing_credentials";
                    break;
                case "pocket.auth.facebook_disabled":
                    _local_3 = "connection.login.error.facebook_disabled.desc";
                    break;
                case "pocket.auth.facebook_not_connected":
                    break;
                case "pocket.auth.access_token_required":
                    _local_3 = "connection.login.error.facebook_accesstoken.desc";
                    break;
                case "ioError":
                    _local_3 = "connection.login.error.-400.desc";
                    break;
                case "account_issue":
                    _local_3 = "generic.error";
                    break;
                default:
                    _local_3 = "generic.error";
            };
            if (((_local_3) && (_local_3.length > 0)))
            {
                showErrorMessage(_localization.getLocalization(_local_3));
            };
        }

        public function getProperty(_arg_1:String, _arg_2:Dictionary=null):String
        {
            var _local_3:String = ((_configuration) ? _configuration.getProperty(_arg_1, _arg_2) : "");
            if (((!(_local_3)) || (_local_3.length == 0)))
            {
                _SafeStr_14.log(("[LoginFlow] Add property: " + _arg_1));
            };
            return (_local_3);
        }

        public function createCaptchaView():_SafeStr_34
        {
            addChild(_closeButton);
            var _local_1:WebCaptchaView = new WebCaptchaView((_SafeStr_3948 as WebApiLoginProvider));
            addChild(_local_1);
            layoutMainElements();
            return (_local_1);
        }

        public function captchaReady():void
        {
            removeChild(_closeButton);
            showScreen(2);
        }

        private function onClose(_arg_1:Button):void
        {
            removeChild(_closeButton);
            _SafeStr_3948.closeCaptcha();
            showScreen(2);
        }

        public function updateEnvironment(_arg_1:String, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                _localization.loadDefaultEmbedLocalizations(_arg_1);
                return;
            };
            CommunicationUtils.writeSOLProperty("environment", _arg_1);
            _configuration.updateEnvironmentId(_arg_1);
            if (_SafeStr_9225)
            {
                _SafeStr_9225.updateEnvironment();
            };
            _localization.loadDefaultEmbedLocalizations(_configuration.getProperty("environment.id"));
            _SafeStr_14.log(("[LoginFlow] updated environment to: " + _arg_1));
            _communication.updateHostParameters();
            _localization.requestLocalizationInit();
        }


    }
}//package login

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_27 = "Ubuntu-BI_ttf$3742fce71b44baa5c02674273d694b861266045718" (String#6280, DoABC#3)
// _SafeStr_28 = "Ubuntu-B_ttf$6c5a8aaacd65083dbc55d58bdd209e802091835414" (String#6283, DoABC#3)
// _SafeStr_29 = "Ubuntu-I_ttf$34355186168a045ef71e0c00e88ec1192085926455" (String#6285, DoABC#3)
// _SafeStr_30 = "Ubuntu-R_ttf$5275761c9603c5ce201d03407747850d2052509749" (String#6287, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_34 = "_-41Q" (String#6823, DoABC#3)
// _SafeStr_3542 = "_-q1o" (String#10062, DoABC#3)
// _SafeStr_3947 = "_-n1V" (String#9878, DoABC#3)
// _SafeStr_3948 = "_-9o" (String#7201, DoABC#3)
// _SafeStr_4036 = "_-Mr" (String#8042, DoABC#3)
// _SafeStr_9224 = "_-01i" (String#6489, DoABC#3)
// _SafeStr_9225 = "_-Y1r" (String#8854, DoABC#3)
// _SafeStr_9226 = "_-02S" (String#6510, DoABC#3)
// _SafeStr_9227 = "_-81N" (String#7078, DoABC#3)
// _SafeStr_9228 = "_-x1G" (String#10507, DoABC#3)
// _SafeStr_9229 = "_-eT" (String#9307, DoABC#3)
// _SafeStr_9230 = "_-ym" (String#10646, DoABC#3)
// _SafeStr_9231 = "_-bx" (String#9098, DoABC#3)
// _SafeStr_9232 = "_-B1f" (String#7314, DoABC#3)


