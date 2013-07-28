package com.BBsRs.liquidparts;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.BBsRs.liquidparts.R;

public class Help extends Fragment{
	
	String Info;
	
	public Help() { 
		this("");
	}
	
	public Help(String Info) {
		this.Info=Info;
	}
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.help, null);
		TextView wv = (TextView)view.findViewById(R.id.textView1);
		wv.setText(Html.fromHtml(Info));
		wv.setMovementMethod(LinkMovementMethod.getInstance());
		return view;
	}

}
