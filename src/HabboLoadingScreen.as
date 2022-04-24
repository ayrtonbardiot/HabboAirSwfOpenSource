// by nota

//HabboLoadingScreen

package 
{
    import flash.display.Sprite;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Timer;
    import splash.PhotoSplashScreen;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.habbo.configuration.HabboConfigurationManager;
    import com.sulake.habbo.localization.HabboLocalizationManager;
    import onBoardingHcUi.LoaderUI;
    import flash.text.TextField;
    import flash.desktop.NativeApplication;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import flash.display.DisplayObject;
    import flash.display.Stage;

    public class HabboLoadingScreen extends Sprite implements _SafeStr_13, IHabboLoadingScreen 
    {

        private static const _SafeStr_9259:int = 28;
        public static const LOADING_BAR_WIDTH:int = 400;
        public static const LOADING_BAR_HEIGHT:int = 25;
        public static const LOADING_BAR_BORDER_WIDTH:int = 2;
        public static const LOADING_BAR_BORDER_SPACING:int = 2;
        public static const CONTAINER:String = "container";
        public static const FILE_LOADING_BAR:String = "fileLoadingBar";
        public static const FILE_BAR_SPRITE:String = "fileBarSprite";
        public static const PHOTO_SPLASH_SCREEN:String = "photoSplashScreen";
        public static const BACKGROUND:String = "background";
        public static const _SafeStr_9260:String = "habboLogo";
        public static const _SafeStr_9166:String = "textField";
        public static const VERSION_TEXT_FIELD:String = "versionTextField";
        public static const _SafeStr_9261:String = "loadingNumberTextField";

        private var _SafeStr_9262:Timer;
        private var _barProgression:int = 0;
        private var _SafeStr_9257:PhotoSplashScreen;
        private var _disposed:Boolean = false;
        private var _SafeStr_9258:int = 0;
        private var _SafeStr_9263:String = null;
        private var _SafeStr_9228:_SafeStr_31;
        private var _configuration:HabboConfigurationManager;
        private var _localization:HabboLocalizationManager;
        private var _SafeStr_9264:Boolean = false;

        public function HabboLoadingScreen(_arg_1:int, _arg_2:int, _arg_3:Dictionary)
        {
            var _local_5:* = null;
            var _local_13:* = null;
            var _local_9:* = null;
            super();
            createFakeContext(_arg_3);
            var _local_14:Sprite = new Sprite();
            _local_14.name = "background";
            _local_14.graphics.clear();
            _local_14.graphics.beginFill(922908);
            _local_14.graphics.drawRect(0, 0, _arg_1, _arg_2);
            addChild(_local_14);
            _SafeStr_9257 = new PhotoSplashScreen(this);
            _SafeStr_9257.name = "photoSplashScreen";
            addChild(_SafeStr_9257);
            _local_5 = new Sprite();
            _local_5.name = "fileLoadingBar";
            _local_5.graphics.lineStyle(1, 0xFFFFFF, 1, true);
            _local_5.graphics.beginFill(2500143);
            _local_5.graphics.drawRect(1, 0, (400 - 1), 0);
            _local_5.graphics.drawRect(400, 1, 0, (25 - 1));
            _local_5.graphics.drawRect(1, 25, (400 - 1), 0);
            _local_5.graphics.drawRect(0, 1, 0, (25 - 1));
            _local_5.graphics.endFill();
            addChild(_local_5);
            var _local_10:String = _localization.getLocalization("client.starting.revolving");
            var _local_4:String = _localization.getLocalization("client.starting");
            var _local_11:String;
            if (_local_10 != null)
            {
                _local_9 = _local_10.split("/");
                _SafeStr_9258 = randomNumber(0, (_local_9.length - 1));
                _SafeStr_9263 = _local_10;
                _local_11 = _local_9[_SafeStr_9258];
            }
            else
            {
                _local_11 = _local_4;
            };
            var _local_6:TextField = LoaderUI.createTextField(_local_11, 28, 0xFFFFFF, true, false, false, false, "center");
            _local_6.name = "textField";
            addChild(_local_6);
            var _local_7:TextField = LoaderUI.createTextField("0%", 14, 0x999999, true, false, false, false, "center");
            _local_7.name = "loadingNumberTextField";
            addChild(_local_7);
            _local_13 = new Sprite();
            _local_13.name = "fileBarSprite";
            _local_5.addChild(_local_13);
            _local_5.visible = true;
            var _local_12:XML = NativeApplication.nativeApplication.applicationDescriptor;
            var _local_8:Namespace = _local_12.namespace();
            var _local_16:String = _local_12._local_8::versionNumber;
            var _local_15:TextField = LoaderUI.createTextField(_local_16, 12, 0x999999, true, false, false, false, "right");
            _local_15.name = "versionTextField";
            addChild(_local_15);
            addEventListener("addedToStage", onAddedToStage);
        }

        private function createFakeContext(_arg_1:Dictionary):void
        {
            _SafeStr_9228 = new FakeContext(_arg_1);
            var _local_3:XML = new XML("<manifest><library /></manifest>");
            var _local_2:IAssetLibrary = new AssetLibrary("_assetsTemp@", _local_3);
            (_SafeStr_9228.assets as AssetLibraryCollection).addAssetLibrary(_local_2);
            _configuration = createConfiguration(_SafeStr_9228);
            _localization = createLocalization(_SafeStr_9228);
            _localization.loadDefaultEmbedLocalizations(_configuration.getProperty("environment.id"));
        }

        private function createConfiguration(_arg_1:_SafeStr_31):HabboConfigurationManager
        {
            var _local_5:XML = new XML("<manifest><library /></manifest>");
            var _local_2:ByteArray = (new HabboConfigurationCom.manifest() as ByteArray);
            var _local_3:XML = new XML(_local_2.readUTFBytes(_local_2.length));
            _local_5.library.appendChild(_local_3.component.assets);
            var _local_4:IAssetLibrary = new AssetLibrary("_assetsConfiguration@");
            _local_4.loadFromResource(_local_5, HabboConfigurationCom);
            return (new HabboConfigurationManager(_arg_1, 0, _local_4));
        }

        private function createLocalization(_arg_1:_SafeStr_31):HabboLocalizationManager
        {
            var _local_5:XML = new XML("<manifest><library /></manifest>");
            var _local_2:ByteArray = (new HabboLocalizationCom.manifest() as ByteArray);
            var _local_3:XML = new XML(_local_2.readUTFBytes(_local_2.length));
            _local_5.library.appendChild(_local_3.component.assets);
            var _local_4:IAssetLibrary = new AssetLibrary("_assetsLocalization@");
            _local_4.loadFromResource(_local_5, HabboLocalizationCom);
            return (new HabboLocalizationManager(_arg_1, 0, _local_4));
        }

        private function onRemovedFromStage(_arg_1:Event):void
        {
            _SafeStr_14.log("Habbo Loading Screen was removed from stage.");
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            removeEventListener("addedToStage", onAddedToStage);
            stage.addEventListener("resize", onResize);
            positionLoadingScreenDisplayElements();
            _SafeStr_9262 = new Timer(750);
            _SafeStr_9262.addEventListener("timer", onBarProgressEvent);
            _SafeStr_9262.start();
        }

        private function onResize(_arg_1:Event):void
        {
            positionLoadingScreenDisplayElements();
        }

        private function onBarProgressEvent(_arg_1:Event):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            if (_barProgression == 100)
            {
                if (_SafeStr_9264)
                {
                    _local_4 = _SafeStr_9263.split("/");
                    _local_2 = (getChildByName("textField") as TextField);
                    if (_local_2 != null)
                    {
                        removeElement("textField");
                        _local_3 = LoaderUI.createTextField(_local_4[_SafeStr_9258], 28, 0xFFFFFF, true, false, false, false, "center");
                        _local_3.x = ((width - _local_3.width) / 2);
                        _local_3.y = _local_2.y;
                        _local_3.name = "textField";
                        addChild(_local_3);
                    };
                    _SafeStr_9264 = false;
                };
                _barProgression = 0;
            }
            else
            {
                _barProgression = (_barProgression + Math.min(randomNumber(35, Math.min(randomNumber(45, 55))), (100 - _barProgression)));
            };
            if (((_barProgression == 100) && (!(_SafeStr_9263 == null))))
            {
                _SafeStr_9264 = true;
                _SafeStr_9258 = ((_SafeStr_9258 + 1) % (_SafeStr_9263.split("/").length - 1));
            };
            updateLoadingBarProgression((_barProgression / 100));
        }

        private function randomNumber(_arg_1:Number, _arg_2:Number):Number
        {
            return (Math.floor((Math.random() * ((_arg_2 - _arg_1) + 1))) + _arg_1);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function removeElement(_arg_1:String):void
        {
            var _local_2:DisplayObject = getChildByName(_arg_1);
            if (_local_2 != null)
            {
                removeChild(_local_2);
            };
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (disposed)
            {
                return;
            };
            _disposed = true;
            if (_local_1 != null)
            {
                _local_1.removeEventListener("resize", onResize);
            };
            removeEventListener("addedToStage", onAddedToStage);
            removeEventListener("removedFromStage", onRemovedFromStage);
            removeElement("photoSplashScreen");
            removeElement("background");
            removeElement("textField");
            removeElement("habboLogo");
            removeElement("fileLoadingBar");
            removeElement("container");
            _SafeStr_9262.stop();
            _SafeStr_9262.removeEventListener("timer", onBarProgressEvent);
            if (_SafeStr_9228)
            {
                _SafeStr_9228.dispose();
                _SafeStr_9228 = null;
            };
            if (_localization)
            {
                _localization.dispose();
                _localization = null;
            };
            if (_configuration)
            {
                _configuration.dispose();
                _configuration = null;
            };
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }

        public function positionLoadingScreenDisplayElements():void
        {
            var _local_11:int;
            var _local_14:int;
            var _local_8:Stage = this.stage;
            if (_local_8 != null)
            {
                _local_11 = _local_8.stageWidth;
                _local_14 = _local_8.stageHeight;
            }
            else
            {
                _local_11 = this.width;
                _local_14 = this.height;
            };
            var _local_9:Sprite = (getChildByName("background") as Sprite);
            if (_local_9 != null)
            {
                _local_9.x = 0;
                _local_9.y = 0;
                _local_9.graphics.clear();
                _local_9.graphics.beginFill(922908);
                _local_9.graphics.drawRect(0, 0, _local_11, _local_14);
            };
            var _local_15:int;
            var _local_6:int;
            var _local_12:int;
            var _local_4:int;
            var _local_1:int;
            var _local_3:int = 10;
            var _local_7:Sprite = (getChildByName("photoSplashScreen") as Sprite);
            if (_local_7 != null)
            {
                _local_7.x = ((_local_11 - _local_7.width) / 2);
                _local_1 = (_local_7.y + _local_7.height);
            };
            var _local_5:TextField = (getChildByName("textField") as TextField);
            if (_local_5 != null)
            {
                _local_5.x = ((_local_11 - _local_5.width) / 2);
                if (_local_5.width > _local_12)
                {
                    _local_12 = _local_5.width;
                    _local_15 = _local_5.x;
                };
            };
            var _local_2:TextField = (getChildByName("versionTextField") as TextField);
            if (_local_2 != null)
            {
                _local_2.x = (_local_11 - _local_2.width);
                _local_2.y = 0;
            };
            var _local_13:Sprite = (getChildByName("fileLoadingBar") as Sprite);
            if (_local_13 != null)
            {
                _local_13.x = ((_local_11 - _local_13.width) / 2);
                _local_13.y = _local_1;
                _local_1 = (_local_13.y + _local_13.height);
                if (_local_13.width > _local_12)
                {
                    _local_12 = _local_13.width;
                    _local_15 = _local_13.x;
                };
            };
            var _local_10:TextField = (getChildByName("loadingNumberTextField") as TextField);
            if (_local_10 != null)
            {
                _local_10.x = ((_local_11 - _local_10.width) / 2);
                if (_local_10.width > _local_12)
                {
                    _local_12 = _local_10.width;
                    _local_15 = _local_10.x;
                };
            };
            _local_1 = int(((_local_14 - _local_1) / 2));
            _local_1 = (_local_1 - (_local_3 * 2));
            if (_local_7 != null)
            {
                _local_7.y = _local_1;
                _local_1 = (_local_7.y + _local_7.height);
            };
            if (_local_5 != null)
            {
                _local_5.y = (_local_1 + 50);
                _local_1 = ((_local_5.y + _local_5.height) + _local_3);
            };
            if (_local_13 != null)
            {
                _local_13.y = _local_1;
                _local_1 = int(((_local_13.y + _local_13.height) + (_local_3 / 2)));
            };
            if (_local_10 != null)
            {
                _local_10.y = _local_1;
            };
        }

        public function updateLoadingBarProgression(_arg_1:Number):void
        {
            var _local_6:* = 400;
            var _local_9:int = 25;
            var _local_5:int = 2;
            var _local_3:int = 2;
            var _local_8:Sprite = (getChildByName("fileLoadingBar") as Sprite);
            if (_local_8 == null)
            {
                return;
            };
            var _local_7:Sprite = (_local_8.getChildByName("fileBarSprite") as Sprite);
            if (_local_7 == null)
            {
                return;
            };
            _local_7.x = (_local_5 + _local_3);
            _local_7.y = (_local_5 + _local_3);
            _local_7.graphics.clear();
            var _local_4:int = ((_local_9 - (_local_5 * 2)) - (_local_3 * 2));
            var _local_2:int = (((_local_6 - (_local_5 * 2)) - (_local_3 * 2)) * _arg_1);
            _local_7.graphics.beginFill(0);
            _local_7.graphics.drawRect(-1, -1, (_local_6 - (_local_5 * 2)), (_local_9 - (_local_3 * 2)));
            _local_7.graphics.endFill();
            _local_7.graphics.beginFill(12241619);
            _local_7.graphics.drawRect(0, 0, _local_2, (_local_4 / 2));
            _local_7.graphics.endFill();
            _local_7.graphics.beginFill(9216429);
            _local_7.graphics.drawRect(0, (_local_4 / 2), _local_2, ((_local_4 / 2) + 1));
            _local_7.graphics.endFill();
        }

        public function updateLoadingBar(_arg_1:Number):void
        {
            var _local_2:TextField = (getChildByName("loadingNumberTextField") as TextField);
            if (_local_2 != null)
            {
                _local_2.text = (Math.round((_arg_1 * 100)) + "%");
            };
        }


    }
}//package 

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_9166 = "_-s11" (String#10175, DoABC#3)
// _SafeStr_9228 = "_-x1G" (String#10507, DoABC#3)
// _SafeStr_9257 = "_-Uy" (String#8599, DoABC#3)
// _SafeStr_9258 = "_-Bz" (String#7351, DoABC#3)
// _SafeStr_9259 = "_-w2" (String#10471, DoABC#3)
// _SafeStr_9260 = "_-uU" (String#10353, DoABC#3)
// _SafeStr_9261 = "_-r1L" (String#10124, DoABC#3)
// _SafeStr_9262 = "_-l19" (String#9735, DoABC#3)
// _SafeStr_9263 = "_-o1P" (String#9928, DoABC#3)
// _SafeStr_9264 = "_-n1N" (String#9874, DoABC#3)


