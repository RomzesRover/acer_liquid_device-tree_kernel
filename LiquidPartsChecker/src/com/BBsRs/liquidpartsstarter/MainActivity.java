package com.BBsRs.liquidpartsstarter;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.view.Menu;

public class MainActivity extends PreferenceActivity {

	@SuppressWarnings("deprecation")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		//setContentView(R.layout.activity_main);

		try {
		Intent intent = new Intent();
		intent.setComponent(new ComponentName("com.BBsRs.liquidpartsDonate", "com.BBsRs.liquidparts.LiquidPartsActivity"));
		startActivity(intent);
		finish();
		} catch (ActivityNotFoundException e){
			try {
			Intent intent = new Intent();
			intent.setComponent(new ComponentName("com.BBsRs.liquidparts", "com.BBsRs.liquidparts.LiquidPartsActivity"));
			startActivity(intent);
			finish();
			} catch (ActivityNotFoundException e1){
				addPreferencesFromResource(R.xml.settings);

				Preference myPref = (Preference) findPreference("free");
				myPref.setOnPreferenceClickListener(new OnPreferenceClickListener() {
				             public boolean onPreferenceClick(Preference preference) {
				            	 Intent intent = new Intent(Intent.ACTION_VIEW);
				            	 intent.setData(Uri.parse("market://details?id=com.BBsRs.liquidparts"));
				            	 startActivity(intent);
				            	 finish();
								return false;
				                 //open browser or intent here
				             }
				         });

				Preference myPref2 = (Preference) findPreference("paid");
				myPref2.setOnPreferenceClickListener(new OnPreferenceClickListener() {
				             public boolean onPreferenceClick(Preference preference) {
				            	 Intent intent = new Intent(Intent.ACTION_VIEW);
				            	 intent.setData(Uri.parse("market://details?id=com.BBsRs.liquidpartsDonate"));
				            	 startActivity(intent);
				            	 finish();
								return false;
				                 //open browser or intent here
				             }
				         });
			}

		}




	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}



}
